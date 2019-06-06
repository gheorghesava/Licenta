package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.time.LocalDateTime
import java.util.*
import javax.persistence.*

@Entity
class ClientOrder(
        @ManyToOne
        @JsonIgnore
        val client:Client,
        val type: OrderType,
        var status: OrderStatus,
        val createdAt: LocalDateTime,
        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name="restaurant_id")
        val restaurant: Restaurant
):BaseEntity() {
    var totalPrice:Int=0
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