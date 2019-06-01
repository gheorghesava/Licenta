import 'package:flutter/material.dart';

class User{
  int id;
  String email;
  String username;
  String phoneNumber;
  double sold;

  User({
    @required this.id,
    @required this.email,
    @required this.username,
    @required this.phoneNumber,
    @required this.sold
  });

  static User fromMap(Map<String, dynamic> userMap){
    return User(id:userMap['id'],email: userMap['email'], username: userMap['username'], phoneNumber: userMap['phoneNumber'],sold: userMap['sold']);
  }
}