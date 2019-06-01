package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.*

@Entity
class Restaurant(
        val name: String,
        val phone_number:String,
        val email:String,
        @OneToOne(cascade = [(CascadeType.ALL)])
        @JoinColumn(name="addres_id")
        val address:Address?
        ):BaseEntity(){
        @OneToMany(cascade = [(CascadeType.ALL)], fetch = FetchType.EAGER, mappedBy = "restaurant")
        @JsonIgnoreProperties("restaurant")
        val dishList= mutableListOf<Dish>()
}