package com.order.ordermgmt.services

import com.order.ordermgmt.dtos.LoginData
import com.order.ordermgmt.dtos.ClientRegisterData
import com.order.ordermgmt.dtos.StaffRegisterData
import com.order.ordermgmt.models.Client
import com.order.ordermgmt.models.Cook
import com.order.ordermgmt.models.Manager

interface AuthService {
    fun clientLogin(loginData: LoginData):Client?
    fun clientRegister(registerData: ClientRegisterData):Client?
    fun clientInfo(id:Long):Client?

    fun managerLogin(loginData: LoginData): Manager?
    fun managerRegister(registerData: StaffRegisterData):Manager?
    fun managerInfo(id:Long):Manager

    fun cookLogin(loginData: LoginData): Cook?
    fun cookRegister(registerData: StaffRegisterData):Cook?
}