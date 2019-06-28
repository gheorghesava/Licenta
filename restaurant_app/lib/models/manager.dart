
import 'package:common_widgets/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Manager extends User {
  int restaurant;

  Manager(
      {@required id,
      @required email,
      @required username,
      @required phoneNumber,
      @required this.restaurant})
      : super(id: id, email: email, username: username, phoneNumber: phoneNumber);
            
  static Manager fromMap(Map<String, dynamic> map) {
    return Manager(
        id: map['id'],
        email: map['email'],
        username: map['username'],
        phoneNumber: map['phoneNumber'],
        restaurant: map['restaurant']['id']);
  }
}
