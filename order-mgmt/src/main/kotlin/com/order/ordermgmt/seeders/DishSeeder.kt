package com.order.ordermgmt.seeders

import com.github.javafaker.Faker
import com.order.ordermgmt.models.Dish
import com.order.ordermgmt.repositories.DishRepository
import com.order.ordermgmt.repositories.DishTypeRepository
import com.order.ordermgmt.repositories.RestaurantRepository
import org.springframework.stereotype.Component

@Component
class DishSeeder(
        val dishRepository: DishRepository,
        val dishTypeRepository: DishTypeRepository,
        val restaurantRepository: RestaurantRepository
                 ) {
    fun seed(){
        val faker= Faker()
        dishRepository.deleteAll()
        dishRepository.saveAll((1..50).map{
            Dish(
                    faker.food().spice()+" "+faker.food().ingredient(),
                    faker.lorem().sentence(),
                    faker.number().numberBetween(10, 2000),
                    faker.number().numberBetween(1,100),
                    faker.number().numberBetween(60, 1800),
                    dishTypeRepository.findAll().shuffled().first(),
                    restaurantRepository.findAll().shuffled().first()
            )
        }.toMutableList())
    }
}