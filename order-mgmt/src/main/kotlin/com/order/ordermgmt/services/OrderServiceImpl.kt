package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.ClientOrderDto
import com.order.ordermgmt.models.ClientOrder
import com.order.ordermgmt.models.OrderStatus
import com.order.ordermgmt.models.OrderType
import com.order.ordermgmt.models.StationOrder
import com.order.ordermgmt.repositories.*
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.messaging.simp.SimpMessageHeaderAccessor
import org.springframework.messaging.simp.SimpMessageType
import org.springframework.stereotype.Service
import java.time.LocalDateTime
import org.springframework.messaging.simp.SimpMessagingTemplate



@Service
class OrderServiceImpl(
        val clientRepository: ClientRepository,
        val restaurantRepository: RestaurantRepository,
        val dishRepository: DishRepository,
        val clientOrderRepository: ClientOrderRepository,
        val stationRepository: StationRepository,
        val stationOrderRepository: StationOrderRepository
) :OrderService
{
    @Autowired
    private val messagingTemplate: SimpMessagingTemplate? = null

    override fun sendOrdersToStations(stationOrders: HashMap<Long, StationOrder>) {
        for(orderPair in stationOrders){
            val headerAccessor = SimpMessageHeaderAccessor
                    .create(SimpMessageType.MESSAGE)
            headerAccessor.sessionId = orderPair.key.toString()
            headerAccessor.setLeaveMutable(true)

            messagingTemplate?.convertAndSendToUser(orderPair.key.toString(), "/queue/something", orderPair.value,
                    headerAccessor.messageHeaders)
        }


    }

    override fun splitOrderToStations(clientOrder: ClientOrder){
        var stationOrders=HashMap<Long, StationOrder>()
        for(dish in clientOrder.dishList){
            val station=dish.station
            if( ! stationOrders.keys.contains(station.id) ) {
                stationOrders[station.id] = StationOrder(OrderStatus.OPEN, station, clientOrder, station.cook)
            }
            stationOrders[station.id]?.addDishToOrder(dish)
        }

        for(order in stationOrders){
            order.setValue(stationOrderRepository.save(order.value))
        }
        sendOrdersToStations(stationOrders)

    }

    override fun placeOrder(clientOrderDto: ClientOrderDto): ClientOrder {
        val client=clientRepository.findById(clientOrderDto.clientId).get()
        val restaurant=restaurantRepository.findById(clientOrderDto.restaurantId).get()
        val clientOrder= ClientOrder(
                client = client,
                type = OrderType.DINE_IN,
                status = OrderStatus.OPEN,
                createdAt = LocalDateTime.now(),
                restaurant = restaurant)
        clientOrderDto.orderItems.forEach {
            clientOrder.addDish(dishRepository.findById(it).get())
        }
        val savedClientOrder:ClientOrder=clientOrderRepository.save(clientOrder)
        splitOrderToStations(savedClientOrder)
        return savedClientOrder
    }



    override fun getOrders() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}
