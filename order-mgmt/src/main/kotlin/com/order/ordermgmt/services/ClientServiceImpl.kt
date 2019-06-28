package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.ClientOrderDto
import com.order.ordermgmt.models.ClientOrder
import com.order.ordermgmt.models.OrderStatus
import com.order.ordermgmt.models.OrderType
import com.order.ordermgmt.repositories.*
import org.springframework.stereotype.Service
import java.time.LocalDateTime
import java.util.*

@Service
class ClientServiceImpl(
        val restaurantRepository: RestaurantRepository,
        val dishTypeRepository: DishTypeRepository,
        val clientOrderRepository: ClientOrderRepository,
        val clientRepository: ClientRepository,
        val dishRepository: DishRepository
):ClientService {
}