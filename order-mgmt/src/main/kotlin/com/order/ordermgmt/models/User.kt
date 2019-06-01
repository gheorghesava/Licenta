package com.order.ordermgmt.models

import com.fasterxml.jackson.annotation.JsonIgnore
import javax.persistence.*


@Entity
@Inheritance(strategy=InheritanceType.JOINED)
@Table(name = "app_user")
abstract class User(open val email:String,@JsonIgnore open val password:String,open val username: String,open val phoneNumber: String):BaseEntity()
    