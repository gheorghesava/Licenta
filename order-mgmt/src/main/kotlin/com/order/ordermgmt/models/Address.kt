package com.order.ordermgmt.models

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class Address(val address: String, lat: Double, lng: Double):BaseEntity()