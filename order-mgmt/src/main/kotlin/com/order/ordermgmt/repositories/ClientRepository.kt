package com.order.ordermgmt.repositories

import com.order.ordermgmt.models.Client
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface ClientRepository:CrudRepository<Client,Long>{
}