package com.order.ordermgmt.models

import javax.persistence.Entity
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne

@Entity
class Clerk(
        email:String,
        password:String,
        username: String,
        phone_number: String,
        @ManyToOne
        @JoinColumn(name = "restaurant_id")
        val restaurant:Restaurant): User(email,password,username,phone_number) {
}