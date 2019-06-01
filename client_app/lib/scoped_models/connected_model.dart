import 'package:client_app/models/client_order.dart';
import 'package:client_app/models/restaurant.dart';
import 'package:client_app/models/user.dart';
import 'package:flutter/material.dart';
import "package:scoped_model/scoped_model.dart";


mixin ConnectedModel on Model{
  @protected String baseUrl="http://192.168.43.246:8081";
  @protected User authenticatedUser;
  @protected List<Restaurant> restaurantList=[];
  @protected ClientOrder clientOrder;
}