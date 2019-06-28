import 'package:flutter/foundation.dart';

class DishType{
  int id;
  String name;

  DishType({
    @required this.id,
    @required this.name,
  });

  static DishType fromMap(Map<String, dynamic> dishTypeMap){
    return DishType(id: dishTypeMap['id'],name: dishTypeMap['name']);
  }
}