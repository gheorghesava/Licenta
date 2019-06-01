package com.order.ordermgmt.repositories

import com.order.ordermgmt.models.GroupOrder
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface GroupOrderRepository:CrudRepository<GroupOrder,Long>