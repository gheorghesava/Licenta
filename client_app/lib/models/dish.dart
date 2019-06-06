import 'package:client_app/models/dish_type.dart';
import 'package:flutter/material.dart';

class Dish{
  int id;
  String title;
  String description;
  int quantity;
  int price;
  int cookTime;
  DishType dishType;

  Dish({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.quantity,
    @required this.price,
    @required this.cookTime,
    @required this.dishType,
  });

  static Dish fromMap(Map<String, dynamic> dishMap){
    return Dish(
      id: dishMap['id'],
      title: dishMap['title'],
      description: dishMap['description'],
      quantity: dishMap['quantity'],
      price: dishMap['price'],
      cookTime: dishMap['cookTime'],
      dishType: DishType.fromMap(dishMap['dishType'])
    );
  }
}