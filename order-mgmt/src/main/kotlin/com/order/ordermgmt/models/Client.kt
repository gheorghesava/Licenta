package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.Entity
import javax.persistence.ManyToMany

@Entity
class Client(
        email:String,
        password:String,
        username: String,
        phone_number: String,
        var sold: Double
        ): User(email,password,username,phone_number)
{
        @ManyToMany(mappedBy = "client")
        @JsonIgnoreProperties("client")
        val orderList= mutableListOf<ClientOrder>()
}