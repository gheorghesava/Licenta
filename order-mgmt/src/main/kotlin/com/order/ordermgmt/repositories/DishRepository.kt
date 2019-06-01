package com.order.ordermgmt.repositories

import com.order.ordermgmt.models.Dish
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface DishRepository:CrudRepository<Dish, Long>