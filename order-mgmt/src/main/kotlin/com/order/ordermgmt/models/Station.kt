package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnore
import javax.persistence.Entity
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne
import javax.persistence.OneToMany

@Entity
class Station(
        val name:String
):BaseEntity(){
    @ManyToOne
    @JoinColumn(name="cook_Id")
    @JsonIgnore
    val cook:Cook?=null

    @OneToMany
    @JsonIgnore
    val dishList= mutableListOf<Dish>()
}