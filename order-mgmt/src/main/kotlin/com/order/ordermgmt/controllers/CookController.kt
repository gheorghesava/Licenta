package com.order.ordermgmt.controllers

import com.order.ordermgmt.dtos.StationDto
import com.order.ordermgmt.models.Station
import com.order.ordermgmt.repositories.StationRepository
import com.order.ordermgmt.services.OrderService
import org.springframework.web.bind.annotation.*
import org.springframework.messaging.simp.SimpMessageHeaderAccessor.getSessionAttributes
import org.springframework.messaging.simp.SimpMessageHeaderAccessor
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.Payload


@RestController
@RequestMapping("/cook")
class CookController(
        val stationRepository: StationRepository,
        val orderService: OrderService

) {
    @MessageMapping("/station.subscribe")
    @SendTo("/topic/public")
    fun sunscribeStation(@Payload stationId:Long, headerAccessor: SimpMessageHeaderAccessor): Station {
        return stationRepository.findById(stationId).get()
    }


    @PostMapping("/unsubscribe")
    fun unsubscribeStation(@RequestBody stationData: StationDto){

    }

    @GetMapping("/stations")
    fun getStations():MutableIterable<Station> = stationRepository.findAll()


}