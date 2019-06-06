package com.order.ordermgmt.seeders

import com.github.javafaker.Faker
import com.order.ordermgmt.models.ClientOrder
import com.order.ordermgmt.models.OrderStatus
import com.order.ordermgmt.models.OrderType
import com.order.ordermgmt.repositories.ClientOrderRepository
import com.order.ordermgmt.repositories.ClientRepository
import com.order.ordermgmt.repositories.DishRepository
import com.order.ordermgmt.repositories.RestaurantRepository
import org.springframework.stereotype.Component
import java.time.LocalDateTime
import java.time.ZoneId
import java.util.concurrent.TimeUnit

@Component
class ClientOrderSeeder(val clientRepository: ClientRepository,
                        val dishRepository: DishRepository,
                        val clientOrderRepository: ClientOrderRepository,
                        val restaurantRepository: RestaurantRepository) {
    fun seed(){
        val faker=Faker()
        clientOrderRepository.deleteAll()
        clientOrderRepository.saveAll((1..10).map{
            ClientOrder(
                    client =clientRepository.findAll().shuffled().first(),
                    type =faker.options().option(OrderType::class.java),
                    status = faker.options().option(OrderStatus::class.java),
                    createdAt = faker.date().past(3,TimeUnit.DAYS).toInstant()
                            .atZone(ZoneId.systemDefault())
                            .toLocalDateTime(),
                    restaurant = restaurantRepository.findAll().shuffled().first()
            ).addDishList((1..10).map { dishRepository.findAll().shuffled().first() }.toMutableList())
        })

    }
}