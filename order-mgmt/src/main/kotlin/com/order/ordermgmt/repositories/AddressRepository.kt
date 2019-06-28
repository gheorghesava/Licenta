package com.order.ordermgmt.repositories

import com.order.ordermgmt.models.Address
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface AddressRepository: JpaRepository<Address,Long>