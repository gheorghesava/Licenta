import 'package:flutter/material.dart';

class User{
  int id;
  String email;
  String username;
  String phoneNumber;

  User({
    @required this.id,
    @required this.email,
    @required this.username,
    @required this.phoneNumber,
  });
}