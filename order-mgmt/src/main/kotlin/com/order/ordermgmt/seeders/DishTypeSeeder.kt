package com.order.ordermgmt.seeders

import com.github.javafaker.Faker
import com.order.ordermgmt.models.DishType
import com.order.ordermgmt.repositories.DishTypeRepository
import org.springframework.stereotype.Component

@Component
class DishTypeSeeder(val dishTypeRepository: DishTypeRepository) {
    fun seed(){
        dishTypeRepository.deleteAll()
        dishTypeRepository.save(DishType("Pizza"))
        dishTypeRepository.save(DishType("Pasta"))
        dishTypeRepository.save(DishType("Salad"))
        dishTypeRepository.save(DishType("Stew"))
        dishTypeRepository.save(DishType("Cakes"))
        dishTypeRepository.save(DishType("BBQ"))
        dishTypeRepository.save(DishType("Burgers"))


    }
}