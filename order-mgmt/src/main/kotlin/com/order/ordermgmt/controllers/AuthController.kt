package com.order.ordermgmt.controllers

import com.order.ordermgmt.dtos.LoginData
import com.order.ordermgmt.dtos.RegisterData
import com.order.ordermgmt.models.Client
import com.order.ordermgmt.services.AuthServiceImpl
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/auth")
class AuthController(val authServiceImpl: AuthServiceImpl) {

    @PostMapping("/client/login")
    fun clientLogin(@RequestBody loginData: LoginData):Client?{
        return authServiceImpl.clientLogin(loginData)
    }

    @PostMapping("/client/register")
    fun clientRegister(@RequestBody registerData: RegisterData):Client?{
        return authServiceImpl.clientRegister(registerData)
    }

    @GetMapping("/client/{id}")
    fun clientDetails(@PathVariable(value = "id") id:Long):Client?{
        return authServiceImpl.clientInfo(id)
    }

    @PostMapping("/worker/login")
    fun kitchenWorkerLogin(){
        println("kitchen worker login")
    }

    @PostMapping("/worker/register")
    fun kitchenWorkerRegister(){
        println("kitchen worker register")
    }
}