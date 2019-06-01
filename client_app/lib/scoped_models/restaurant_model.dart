import 'dart:convert';
import 'package:client_app/models/restaurant.dart';
import 'package:http/http.dart' as http;

import 'package:client_app/scoped_models/connected_model.dart';

mixin RestaurantModel on ConnectedModel{
  Future<bool> fetchRestaurants() async{
    http.Response response=await http.get(baseUrl+'/client/restaurants/all');
    if (response.statusCode != 200 && response.statusCode != 201) return false;
    for(Map<String,dynamic> restaurantMap in json.decode(response.body)){
      restaurantList.add(Restaurant.fromMap(restaurantMap));
    }
    notifyListeners();
    return true;
  }
  List<Restaurant> get restaurantList => super.restaurantList;
}