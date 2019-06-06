package com.order.ordermgmt.seeders

import com.github.javafaker.Faker
import com.order.ordermgmt.models.Client
import com.order.ordermgmt.repositories.ClientRepository
import org.springframework.stereotype.Component

@Component
class ClientSeeder(val clientRepository: ClientRepository) {
    fun seed(){
        val faker= Faker()
        clientRepository.deleteAll()
        clientRepository.saveAll((1..10).map{
            Client(
                    faker.name().username()+"@gmail.com",
                    "secret",
                    faker.name().username(),
                    faker.phoneNumber().cellPhone(),
                    faker.number().numberBetween(50,1000)
            )
        })
    }
}
