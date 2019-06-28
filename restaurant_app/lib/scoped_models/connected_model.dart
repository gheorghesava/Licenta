import 'package:common_widgets/common_widgets.dart';
import 'package:common_widgets/models/user.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/models/manager.dart';
import 'package:restaurant_app/models/station.dart';
import 'package:restaurant_app/models/station_order.dart';
import 'package:restaurant_app/scoped_models/user_role.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ConnectedModel on Model{
  @protected String baseUrl="http://192.168.43.246:8081";

  @protected User authenticatedUser;
  @protected UserRole userRole;
  @protected UserRole currentRole;

  List<Restaurant> restaurantList=[];

  int currentStationOrderIndex=0;
  List<StationOrder> stationOrderList=[
    StationOrder(
      id:1,
      stationId: 1,
      clientOrderId: 234,
      completionTime: 270,
      dishList: [
        Dish(
          id: 1,
          title: "Somon fume 13",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 2,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 3,
          title: "Somon fume 4",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 4,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 5,
          title: "Somon fume 5",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 1,
          title: "Somon fume 0",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 2,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 3,
          title: "Somon fume 4",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 4,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 5,
          title: "Somon fume 5",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
      ]
    ),
    StationOrder(
      id:2,
      stationId: 1,
      clientOrderId: 235,
      completionTime: 270,
      dishList: [
        Dish(
          id: 1,
          title: "Somon fume 0",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 2,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 3,
          title: "Somon fume 4",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 4,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 5,
          title: "Somon fume 5",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
      ]
    ),
    StationOrder(
      id:3,
      stationId: 1,
      clientOrderId: 236,
      completionTime: 270,
      dishList: [
        Dish(
          id: 1,
          title: "Somon fume 0",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 2,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 3,
          title: "Somon fume 4",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 4,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 5,
          title: "Somon fume 5",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
      ]
    ),
    StationOrder(
      id:4,
      stationId: 1,
      clientOrderId: 237,
      completionTime: 270,
      dishList: [
        Dish(
          id: 1,
          title: "Somon fume 0",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 2,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
        Dish(
          id: 3,
          title: "Somon fume 4",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 4,
          title: "Somon fume 2",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),Dish(
          id: 5,
          title: "Somon fume 5",
          description: "Good fish",
          quantity: 250,
          price: 10,
          cookTime: 90,
          dishType: DishType(id: 1, name: "Fish")
        ),
      ]
    ),
  ];
  List<StationOrder> completedOrders=[];

  List<Dish> dishList=[];
  List<DishType> dishtypeList=[];
  List<Station> stationList=[];

  @protected Station subscribedStation;
}