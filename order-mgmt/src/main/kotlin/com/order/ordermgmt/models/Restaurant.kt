package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.*

@Entity
class Restaurant(
        val name: String,
        val phoneNumber:String,
        val email:String,
        @OneToOne(cascade = [(CascadeType.ALL)])
        @JoinColumn(name="addres_id")
        val address:Address?
        ):BaseEntity(){
        @OneToMany(cascade = [(CascadeType.ALL)], fetch = FetchType.EAGER, mappedBy = "restaurant")
        @JsonIgnoreProperties("restaurant")
        val dishList= mutableListOf<Dish>()

        @OneToMany(cascade = [(CascadeType.ALL)], fetch = FetchType.EAGER, mappedBy = "restaurant")
        @JsonIgnore
        val orderList= mutableListOf<Dish>()

        @OneToMany(cascade = [(CascadeType.ALL)])
        @JsonIgnore
        val stationList= mutableListOf<Station>()
}