package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.ClientOrderDto
import com.order.ordermgmt.models.ClientOrder
import com.order.ordermgmt.models.StationOrder

interface OrderService {
    fun getOrders()
    fun placeOrder(clientOrderDto: ClientOrderDto): ClientOrder
    fun splitOrderToStations(clientOrder: ClientOrder)
    fun sendOrdersToStations(stationOrders:HashMap<Long,StationOrder>)
}
