package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.*

@Entity
class GroupOrder(var orderStatus:OrderStatus):BaseEntity(){
    @OneToMany(cascade = [CascadeType.ALL])
    @JsonIgnoreProperties("groupOrder")
    val clientOrderList= mutableListOf<ClientOrder>()

    var totalPrice:Double=0.0

    fun addClientOrder(clientOrder: ClientOrder){
        clientOrderList.add(clientOrder)
        totalPrice+=clientOrder.totalPrice
    }
}