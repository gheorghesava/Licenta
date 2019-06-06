import 'package:client_app/models/dish.dart';
import 'package:client_app/models/restaurant.dart';
import 'package:client_app/models/user.dart';
import 'package:flutter/material.dart';

class ClientOrder {
  int id;
  int clientId;
  int restaurantId;
  int totalPrice;
  String status;
  String type;
  DateTime createdAt;
  List<Dish> itemList=[];

  ClientOrder({
    this.id, 
    @required this.clientId,
    @required this.restaurantId, 
    this.type,
    this.status,
    this.createdAt,
    this.totalPrice=0, 
    this.itemList});

  void addDish(Dish dish) {
    itemList.add(dish);
    totalPrice+=dish.price;
  }

  void removeDish(Dish dish){
    for(int i=0; i<itemList.length; i++){
      if(itemList[i].id==dish.id){
        itemList.removeAt(i);
        totalPrice-=dish.price;
        break;
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'clientId': clientId,
      'restaurantId': restaurantId,
      'orderItems': itemList.map((dish) => dish.id).toList()
    };
  }

  static ClientOrder fromMap(Map<String, dynamic> orderMap){
    return ClientOrder(
      id:orderMap['id'],
      clientId: orderMap['client'], 
      restaurantId: orderMap['restaurant']['id'],
      type: orderMap['type'],
      status: orderMap['status'],
      createdAt: DateTime.parse(orderMap['createdAt']),
      totalPrice: orderMap['totalPrice'], 
      itemList: (orderMap['dishList'] as List).map((dishMap)=> Dish.fromMap(dishMap)).toList());
  }
}
