package com.order.ordermgmt.repositories

import com.order.ordermgmt.models.Address
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface AddressRepository: CrudRepository<Address,Long>