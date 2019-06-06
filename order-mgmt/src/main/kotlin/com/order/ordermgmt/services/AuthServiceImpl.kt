package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.LoginData
import com.order.ordermgmt.dtos.RegisterData
import com.order.ordermgmt.models.Client
import com.order.ordermgmt.repositories.ClientRepository
import org.springframework.stereotype.Service

@Service
class AuthServiceImpl(
        private val clientRepository: ClientRepository
):AuthService {

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

    override fun clientRegister(registerData: RegisterData): Client? {
        clientRepository.findAll().forEach {
            if(it.email==registerData.email){
                return null
            }
        }
        return clientRepository.save(Client(registerData.email,registerData.password,registerData.username,registerData.phoneNumber,1500))
    }
}