package com.order.ordermgmt.repositories

import com.order.ordermgmt.models.Restaurant
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface RestaurantRepository:CrudRepository<Restaurant,Long>