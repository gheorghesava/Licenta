package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.time.LocalDateTime
import javax.persistence.*

@Entity
class StationOrder(
        val status: OrderStatus,
        @ManyToOne
        @JoinColumn(name="station_id")
        val station: Station,

        @ManyToOne
        @JoinColumn
        val clientOrder: ClientOrder,

        @ManyToOne
        @JoinColumn(name="cook_id")
        val cook: Cook?

):BaseEntity(){
    var completionTime:Int=0
    @ManyToMany()
    @JoinTable(name="station_order_dish",
            joinColumns = [(JoinColumn(name="order_id", referencedColumnName = "id"))],
            inverseJoinColumns = [(JoinColumn(name = "dish_id",referencedColumnName = "id"))])
    @JsonIgnore
    val dishList= mutableListOf<Dish>()


    fun addDishToOrder(dish:Dish){
        completionTime+=dish.cookTime
        dishList.add(dish)
    }

    fun addDishListToOrder(dishList:MutableList<Dish>):StationOrder{
        dishList.forEach {
            completionTime+=it.cookTime
            dishList.add(it)
        }
        return this
    }
}