package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.Entity
import javax.persistence.ManyToMany

@Entity
class Client(
        email:String,
        password:String,
        username: String,
        phoneNumber: String,
        var sold: Int
        ): User(email,password,username,phoneNumber)
{
        @ManyToMany(mappedBy = "client")
        @JsonIgnoreProperties("client")
        val orderList= mutableListOf<ClientOrder>()
}