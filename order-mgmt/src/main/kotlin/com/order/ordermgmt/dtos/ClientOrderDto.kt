package com.order.ordermgmt.dtos

class ClientOrderDto(
        val clientId: Long,
        val orderItems: MutableList<Long>)