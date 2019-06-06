package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.ClientOrderDto
import com.order.ordermgmt.models.ClientOrder
import com.order.ordermgmt.models.OrderStatus
import com.order.ordermgmt.models.OrderType
import com.order.ordermgmt.repositories.*
import org.springframework.stereotype.Service
import java.time.LocalDateTime
import java.util.*

@Service
class ClientServiceImpl(
        val restaurantRepository: RestaurantRepository,
        val dishTypeRepository: DishTypeRepository,
        val clientOrderRepository: ClientOrderRepository,
        val clientRepository: ClientRepository,
        val dishRepository: DishRepository
):ClientService {
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
        return clientOrderRepository.save(clientOrder)
    }

    override fun getOrders() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }


}