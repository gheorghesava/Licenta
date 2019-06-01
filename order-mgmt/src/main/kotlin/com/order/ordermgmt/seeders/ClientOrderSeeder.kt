package com.order.ordermgmt.seeders

import com.github.javafaker.Faker
import com.order.ordermgmt.models.ClientOrder
import com.order.ordermgmt.repositories.ClientOrderRepository
import com.order.ordermgmt.repositories.ClientRepository
import com.order.ordermgmt.repositories.DishRepository
import org.springframework.stereotype.Component
import java.util.*

@Component
class ClientOrderSeeder(val clientRepository: ClientRepository,
                        val dishRepository: DishRepository,
                        val clientOrderRepository: ClientOrderRepository) {
    fun seed(){
        clientOrderRepository.deleteAll()
        clientOrderRepository.saveAll((1..10).map{
            ClientOrder(clientRepository.findAll().shuffled().first()).addDishList((1..10).map { dishRepository.findAll().shuffled().first() }.toMutableList())
        })

    }
}