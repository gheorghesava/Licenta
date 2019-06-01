package com.order.ordermgmt.models

import javax.persistence.*

@Entity
class DishType(
        val name:String
    ):BaseEntity()