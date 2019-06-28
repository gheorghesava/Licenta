package com.order.ordermgmt.repositories

import com.order.ordermgmt.models.StationOrder
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface StationOrderRepository : JpaRepository<StationOrder, Long> {
}