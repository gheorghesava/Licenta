package com.order.ordermgmt.seeders

import com.github.javafaker.Faker
import com.order.ordermgmt.models.ClientOrder
import com.order.ordermgmt.models.GroupOrder
import com.order.ordermgmt.models.OrderStatus
import com.order.ordermgmt.repositories.ClientOrderRepository
import com.order.ordermgmt.repositories.ClientRepository
import com.order.ordermgmt.repositories.DishRepository
import com.order.ordermgmt.repositories.GroupOrderRepository
import org.springframework.stereotype.Component

@Component
class GroupOrderSeeder(val dishRepository: DishRepository,
                       val clientRepository: ClientRepository,
                       val clientOrderRepository: ClientOrderRepository,
                       val groupOrderRepository: GroupOrderRepository) {
    fun seed(){
    }
}