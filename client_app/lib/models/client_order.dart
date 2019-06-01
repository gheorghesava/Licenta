import 'package:client_app/models/dish.dart';
import 'package:client_app/models/user.dart';
import 'package:flutter/material.dart';

class ClientOrder {
  User client;
  double totalPrice=0;
  List<Dish> itemList = [];

  ClientOrder({@required this.client});

  void addDish(Dish dish) {
    print(client.id);
    itemList.add(dish);
    totalPrice+=dish.price;
  }

  void removeDish(Dish dish){
    itemList=itemList.where((it)=> it.id!=dish.id);
    totalPrice-=dish.price;
  }

  Map<String, dynamic> toMap() {
    return {
      'clientId': client.id,
      'orderItems': itemList.map((dish) => dish.id).toList()
    };
  }
}
