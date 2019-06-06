package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.*

@Entity
class Dish(
        val title:String,
        val description: String,
        val quantity:Int,
        val price: Int,
        val cookTime: Int,
        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name="dish_type_id")
        val dishType:DishType,
        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "restaurant_id")
        val restaurant:Restaurant
    ):BaseEntity(){
    @ManyToMany(mappedBy = "dishList")
    @JsonIgnore
    val orderList= mutableListOf<ClientOrder>()
}