import 'package:client_app/models/client_order.dart';
import 'package:client_app/models/dish.dart';
import 'package:client_app/models/restaurant.dart';
import 'package:client_app/models/user.dart';
import 'package:flutter/material.dart';
import "package:scoped_model/scoped_model.dart";


mixin ConnectedModel on Model{
  @protected String baseUrl="http://192.168.43.246:8081";
  @protected User authenticatedUser;
  @protected List<Restaurant> restaurantList=[];
  @protected ClientOrder clientOrder;
  @protected int restaurantId;
  @protected int dishId;
  @protected int orderId;

  void selectRestaurant(int id){
    restaurantId=id;
    if(id!=null){
      notifyListeners();
    }
  }

  Restaurant get selectedRestaurant {
    return restaurantId==null?
      null:
      restaurantList.firstWhere((Restaurant res)=> res.id == restaurantId);
  }

  void selectDish(int id){
    dishId=id;
    if(dishId!=null){
      notifyListeners();
    }
  }

  Dish get selectedDish {
    return (dishId==null || restaurantId==null)?
      null:
      selectedRestaurant.dishList.firstWhere((Dish dish)=> dish.id==dishId);
  }

  void selectOrder(int id){
    orderId=id;
    if(orderId!=null){
      notifyListeners();
    }
  }

  ClientOrder get selectedOrder {
    return orderId==null?
      null:
      this.authenticatedUser.orderList.firstWhere((ClientOrder order)=> order.id == restaurantId);
  }
}