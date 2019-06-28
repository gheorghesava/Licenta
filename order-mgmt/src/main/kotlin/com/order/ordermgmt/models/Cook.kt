package com.order.ordermgmt.models

import javax.persistence.Entity
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne
import javax.persistence.OneToMany

@Entity
class Cook(
        email:String,
        password:String,
        username: String,
        phoneNumber: String,
        @ManyToOne
        @JoinColumn(name = "restaurant_id")
        val restaurant:Restaurant): User(email,password,username,phoneNumber) {

    @ManyToOne
    @JoinColumn(name="station_id")
    val station: Station?=null

    @OneToMany
    val asignedOrders= mutableListOf<ClientOrder>()
}