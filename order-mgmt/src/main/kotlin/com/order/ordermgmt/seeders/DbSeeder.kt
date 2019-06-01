package com.order.ordermgmt.seeders

import org.springframework.boot.CommandLineRunner
import org.springframework.stereotype.Component


@Component
class DbSeeder(
        val restaurantSeeder: RestaurantSeeder,
        val dishTypeSeeder: DishTypeSeeder,
        val dishSeeder: DishSeeder,
        val clientSeeder: ClientSeeder,
        val clientOrderSeeder: ClientOrderSeeder) : CommandLineRunner {
    override fun run(vararg p0: String?) {
//        dishTypeSeeder.seed()
//        restaurantSeeder.seed()
//        dishSeeder.seed()
//        clientSeeder.seed()
//        clientOrderSeeder.seed()
    }
}