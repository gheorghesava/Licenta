package com.order.ordermgmt.seeders

import com.github.javafaker.Faker
import com.order.ordermgmt.models.DishType
import com.order.ordermgmt.repositories.DishTypeRepository
import org.springframework.stereotype.Component

@Component
class DishTypeSeeder(val dishTypeRepository: DishTypeRepository) {
    fun seed(){
        val faker= Faker()
        dishTypeRepository.deleteAll()
        dishTypeRepository.saveAll((1..10).map{DishType(faker.food().ingredient())})
    }
}