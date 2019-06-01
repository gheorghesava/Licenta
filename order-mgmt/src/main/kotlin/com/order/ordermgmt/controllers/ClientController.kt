package com.order.ordermgmt.controllers

import com.order.ordermgmt.dtos.ClientOrderDto
import com.order.ordermgmt.models.*
import com.order.ordermgmt.repositories.ClientOrderRepository
import com.order.ordermgmt.repositories.ClientRepository
import com.order.ordermgmt.repositories.DishTypeRepository
import com.order.ordermgmt.repositories.RestaurantRepository
import com.order.ordermgmt.services.ClientService
import org.springframework.data.repository.findByIdOrNull
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/client")
class ClientController(
        val restaurantRepository: RestaurantRepository,
        val dishTypeRepository: DishTypeRepository,
        val clientOrderRepository: ClientOrderRepository,
        val clientRepository: ClientRepository,
        val clientService: ClientService) {

    @GetMapping("/restaurants/all")
    fun getRestaurants():MutableIterable<Restaurant> = restaurantRepository.findAll()

    @GetMapping("restaurants/{id}")
    fun getRestaurantById(@PathVariable(value = "id") id:Long)=restaurantRepository.findByIdOrNull(id)

    @GetMapping("/dishes")
    fun getDishTypes():MutableIterable<DishType> = dishTypeRepository.findAll()

    @PostMapping("/order")
    fun placeOrder(@RequestBody order: ClientOrderDto):ClientOrder = clientService.placeOrder(order)

    @GetMapping("/{id}")
    fun getOrders(@PathVariable(value="id") id: Long):Client = clientRepository.findById(id).get()
}