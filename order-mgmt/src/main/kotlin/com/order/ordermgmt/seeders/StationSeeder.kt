package com.order.ordermgmt.seeders

import com.order.ordermgmt.models.Station
import com.order.ordermgmt.repositories.StationRepository
import org.springframework.stereotype.Component

@Component
class StationSeeder (val stationRepository: StationRepository){
    fun seed(){
        stationRepository.deleteAll()
        stationRepository.save(Station("Grill"))
        stationRepository.save(Station("Salads"))
        stationRepository.save(Station("Oven"))
        stationRepository.save(Station("Fry"))
    }
}