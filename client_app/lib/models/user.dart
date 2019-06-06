import 'package:client_app/models/client_order.dart';
import 'package:flutter/material.dart';

class User{
  int id;
  String email;
  String username;
  String phoneNumber;
  int sold;
  List<ClientOrder> orderList;

  User({
    @required this.id,
    @required this.email,
    @required this.username,
    @required this.phoneNumber,
    @required this.sold,
    @required this.orderList
  });

  static User fromMap(Map<String, dynamic> userMap){
    return User(
      id:userMap['id'],
      email: userMap['email'], 
      username: userMap['username'], 
      phoneNumber: userMap['phoneNumber'],
      sold: userMap['sold'],
      orderList:(userMap['orderList'] as List).map((orderMap)=> ClientOrder.fromMap(orderMap)).toList());
  }
}