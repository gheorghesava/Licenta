
import 'package:common_widgets/models/address.dart';
import 'package:common_widgets/models/dish.dart';
import 'package:common_widgets/models/dish_type.dart';
import 'package:flutter/cupertino.dart';

class Restaurant {
  int id;
  String name;
  String email;
  String phoneNumber;
  Address address;
  List<Dish> dishList = [];
  List<DishType> dishTypeList = [];

  Restaurant(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.phoneNumber,
      @required this.address,
      @required this.dishList,
      @required this.dishTypeList});

  List<Dish> getDishListByType(DishType type){
    return this.dishList.where((dish)=>dish.dishType.name==type.name).toList();
  }

  static Restaurant fromMap(Map<String, dynamic> restaurantMap) {
    List<Dish> dishList = [];
    List<DishType> dishTypeList = [];

    for (var dishMap in restaurantMap['dishList']) {
      Dish dish = Dish.fromMap(dishMap);
      dishList.add(dish);
      if (!dishTypeList.contains(dish.dishType)) {
        dishTypeList.add(dish.dishType);
      }
    }
    return Restaurant(
        id: restaurantMap['id'],
        name: restaurantMap['name'],
        email: restaurantMap['email'],
        phoneNumber: restaurantMap['phoneNumber'],
        address: Address.fromMap(restaurantMap['address']),
        dishList: dishList,
        dishTypeList: dishTypeList);
  }
}
