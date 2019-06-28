package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.LoginData
import com.order.ordermgmt.dtos.ClientRegisterData
import com.order.ordermgmt.dtos.StaffRegisterData
import com.order.ordermgmt.models.Client
import com.order.ordermgmt.models.Cook
import com.order.ordermgmt.models.Manager
import com.order.ordermgmt.repositories.ClientRepository
import com.order.ordermgmt.repositories.CookRepository
import com.order.ordermgmt.repositories.ManagerRepository
import com.order.ordermgmt.repositories.RestaurantRepository
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service


@Service
class AuthServiceImpl(
        private val clientRepository: ClientRepository,
        private val managerRepository: ManagerRepository,
        private val restaurantRepository: RestaurantRepository,
        private val cookRepository: CookRepository
):AuthService {

    override fun cookLogin(loginData: LoginData): Cook? {
        var cook:Cook?=null
        cookRepository.findAll().forEach {
            if(it.email==loginData.email && it.password==loginData.password){
                cook=it
            }
        }
        return cook
    }

    override fun cookRegister(registerData: StaffRegisterData): Cook? {
        cookRepository.findAll().forEach {
            if(it.email==registerData.email){
                return null
            }
        }
        return restaurantRepository.findByIdOrNull(registerData.restaurant)?.let { Cook(registerData.email,registerData.password,registerData.username,registerData.phoneNumber, it) }?.let { cookRepository.save(it) }
    }

    override fun managerLogin(loginData: LoginData): Manager? {
        var manager:Manager?=null
        managerRepository.findAll().forEach {
            if(it.email==loginData.email && it.password==loginData.password){
                manager=it
            }
        }
        return manager
    }

    override fun managerRegister(registerData: StaffRegisterData): Manager? {
        managerRepository.findAll().forEach {
            if(it.email==registerData.email){
                return null
            }
        }
        return restaurantRepository.findByIdOrNull(registerData.restaurant)?.let { Manager(registerData.email,registerData.password,registerData.username,registerData.phoneNumber, it) }?.let { managerRepository.save(it) }
    }

    override fun managerInfo(id: Long): Manager {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun clientInfo(id:Long): Client? {
        return clientRepository.findById(id).get() //To change body of created functions use File | Settings | File Templates.
    }

    override fun clientLogin(loginData: LoginData): Client? {
        var client:Client?=null
        clientRepository.findAll().forEach {
            if(it.email==loginData.email && it.password==loginData.password){
                client=it
            }
        }
        return client
    }

    override fun clientRegister(registerData: ClientRegisterData): Client? {
        clientRepository.findAll().forEach {
            if(it.email==registerData.email){
                return null
            }
        }
        return clientRepository.save(Client(registerData.email,registerData.password,registerData.username,registerData.phoneNumber,1500))
    }
}