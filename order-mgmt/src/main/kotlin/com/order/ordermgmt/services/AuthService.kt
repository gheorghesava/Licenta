package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.LoginData
import com.order.ordermgmt.dtos.RegisterData
import com.order.ordermgmt.models.Client

interface AuthService {
    fun clientLogin(loginData: LoginData):Client?
    fun clientRegister(registerData: RegisterData):Client?
}