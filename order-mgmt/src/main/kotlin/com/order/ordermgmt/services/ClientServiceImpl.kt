package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.ClientOrderDto
import com.order.ordermgmt.models.ClientOrder
import com.order.ordermgmt.repositories.*
import org.springframework.stereotype.Service

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
        val clientOrder= ClientOrder(client)
        clientOrderDto.orderItems.forEach {
            clientOrder.addDish(dishRepository.findById(it).get())
        }
        return clientOrderRepository.save(clientOrder)
    }

    override fun getOrders() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }


}