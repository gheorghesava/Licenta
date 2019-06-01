package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonBackReference
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonManagedReference
import javax.persistence.*

@Entity
class ClientOrder(
        @ManyToOne
        @JsonIgnore
        val client:Client
):BaseEntity() {
    var totalPrice:Double=0.0
    @ManyToMany()
    @JoinTable(name="client_order_dish",
            joinColumns = [(JoinColumn(name="order_id", referencedColumnName = "id"))],
            inverseJoinColumns = [(JoinColumn(name = "dish_id",referencedColumnName = "id"))])
    @JsonIgnoreProperties("restaurant","orderList")
    val dishList= mutableListOf<Dish>()

    fun addDish(dish: Dish){
//        TODO: check for user sold
        dishList.add(dish)
        totalPrice+=dish.price
        client.sold-=dish.price
    }

    //just for seeding
    fun addDishList(list:MutableList<Dish>):ClientOrder{
        list.forEach {
            dishList.add(it)
            totalPrice+=it.price
        }
        return this
    }
}