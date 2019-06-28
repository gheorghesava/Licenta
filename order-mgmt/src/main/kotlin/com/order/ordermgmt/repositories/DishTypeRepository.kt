package com.order.ordermgmt.repositories

import com.order.ordermgmt.models.DishType
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface DishTypeRepository : JpaRepository<DishType, Long>