package com.order.ordermgmt.controllers

import com.order.ordermgmt.dtos.LoginData
import com.order.ordermgmt.dtos.ClientRegisterData
import com.order.ordermgmt.dtos.StaffRegisterData
import com.order.ordermgmt.models.Client
import com.order.ordermgmt.models.Cook
import com.order.ordermgmt.models.Manager
import com.order.ordermgmt.services.AuthServiceImpl
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/auth")
class AuthController(val authServiceImpl: AuthServiceImpl) {

    @PostMapping("/client/login")
    fun clientLogin(@RequestBody loginData: LoginData):ResponseEntity<Client>{
        val user=authServiceImpl.clientLogin(loginData)
        if(user==null)
            return ResponseEntity.badRequest().body(user)
        return ResponseEntity.ok().body(user)
    }

    @PostMapping("/client/register")
    fun clientRegister(@RequestBody registerData: ClientRegisterData):ResponseEntity<Client>{
        val user=authServiceImpl.clientRegister(registerData)
        if(user==null)
            return ResponseEntity.badRequest().body(user)
        return ResponseEntity.ok().body(user)
    }

    @GetMapping("/client/{id}")
    fun clientDetails(@PathVariable(value = "id") id:Long):Client?{
        return authServiceImpl.clientInfo(id)
    }

    @PostMapping("/manager/login")
    fun managerLogin(@RequestBody loginData: LoginData):ResponseEntity<Manager>{
        val manager=authServiceImpl.managerLogin(loginData)
        if(manager==null)
            return ResponseEntity.badRequest().body(manager)
        return ResponseEntity.ok().body(manager)
    }

    @PostMapping("/manager/register")
    fun managerRegister(@RequestBody staffRegisterData: StaffRegisterData):ResponseEntity<Manager>{
        val manager=authServiceImpl.managerRegister(staffRegisterData)
        if(manager==null)
            return ResponseEntity.badRequest().body(manager)
        return ResponseEntity.ok().body(manager)
    }

    @PostMapping("/cook/login")
    fun cookLogin(@RequestBody loginData: LoginData): ResponseEntity<Cook>{
        val cook= authServiceImpl.cookLogin(loginData)
        if(cook==null)
            return ResponseEntity.badRequest().body(cook)
        return ResponseEntity.ok().body(cook)
    }

    @PostMapping("/cook/register")
    fun cookRegister(@RequestBody staffRegisterData: StaffRegisterData):ResponseEntity<Cook>{
        val cook= authServiceImpl.cookRegister(staffRegisterData)
        if(cook==null)
            return ResponseEntity.badRequest().body(cook)
        return ResponseEntity.ok().body(cook)
    }
}