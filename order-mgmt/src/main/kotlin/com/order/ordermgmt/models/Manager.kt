package com.order.ordermgmt.models

import javax.persistence.Entity
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne


@Entity
class Manager(
        email:String,
        password:String,
        username: String,
        phoneNumber: String,
        @ManyToOne
        @JoinColumn(name = "restaurant_id")
        val restaurant:Restaurant
        ): User(email,password,username,phoneNumber) {

}