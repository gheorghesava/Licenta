import 'dart:convert';

import 'package:common_widgets/models/restaurant.dart';
import 'package:restaurant_app/scoped_models/connected_model.dart';
import 'package:http/http.dart' as http;

mixin RestaurantModel on ConnectedModel {
  Future<void> getRestaurants() async {
    http.Response response = await http.get("$baseUrl/client/restaurants/all");
    if (response.statusCode != 200) return;
    print(json.decode(response.body));
    super.restaurantList = (json.decode(response.body) as List)
        .map((restaurantMap) =>
            Restaurant.fromMap(restaurantMap))
        .toList();
    notifyListeners();
  }
}
