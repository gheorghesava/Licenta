package com.order.ordermgmt.dtos

class ClientOrderDto(
        val clientId: Long,
        val restaurantId: Long,
        val orderItems: MutableList<Long>)