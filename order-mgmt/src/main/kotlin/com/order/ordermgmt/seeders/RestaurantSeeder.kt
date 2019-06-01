package com.order.ordermgmt.seeders

import com.github.javafaker.Faker
import com.order.ordermgmt.models.Address
import com.order.ordermgmt.models.Dish
import com.order.ordermgmt.models.DishType
import com.order.ordermgmt.models.Restaurant
import com.order.ordermgmt.repositories.AddressRepository
import com.order.ordermgmt.repositories.DishTypeRepository
import com.order.ordermgmt.repositories.RestaurantRepository
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Component

@Component
class RestaurantSeeder(
        val restaurantRepository: RestaurantRepository,
        val dishTypeRepository: DishTypeRepository
) {

    fun seed(): Unit {
        val faker = Faker()
        restaurantRepository.deleteAll()
        restaurantRepository.saveAll((1..10).map {
            Restaurant(
                    faker.company().name(),
                    faker.phoneNumber().cellPhone(),
                    faker.name().username() + "@gmail.com",
                    Address(
                            faker.address().fullAddress(),
                            faker.number().randomDouble(6, 0, 100),
                            faker.number().randomDouble(6, 0, 100)
                    )
            )
        })
    }
}