import 'dart:convert';
import 'package:common_widgets/models/dish.dart';
import 'package:restaurant_app/models/station_order.dart';
import 'package:stomp/stomp.dart';
import "package:stomp/vm.dart" show connect;
import 'package:restaurant_app/models/station.dart';
import 'package:restaurant_app/scoped_models/connected_model.dart';
import 'package:http/http.dart' as http;

mixin StationModel on ConnectedModel {
  StompClient _stompClient;

  Future<bool> getStations() async {
    http.Response response = await http.get("$baseUrl/cook/stations");
    print("hello ${response.statusCode} ${json.decode(response.body)}");
    if (response.statusCode != 200) return false;
    super.stationList = (json.decode(response.body) as List)
        .map((station) => Station.fromMap(station))
        .toList();
    print('station: ${stationList[0].name}');
    notifyListeners();
    return true;
  }

  void subscribeToStation(Station station) async {
    print("subs to station");
    // var channel = IOWebSocketChannel.connect("ws$baseUrl/ws");
    connect("ws$baseUrl").then((StompClient client) {
      client.subscribeString(station.id.toString(), "ws$baseUrl/station/orders",
          (Map<String, String> headers, String message) {
        print("Recieve $message");
      });
    });
  }

  void disconnectFromStation(Station station) async {
    Map<String, dynamic> stationMap = {
      'id': station.id,
      'name': station.name,
      'cookId': authenticatedUser.id
    };
  }

  Station get subscribedStation => super.subscribedStation;

  StationOrder get currentStationOrder{
    return super.stationOrderList[super.currentStationOrderIndex];
  } 

  void nextOrder(){
    if(super.currentStationOrderIndex<stationOrderList.length-1){
      currentStationOrderIndex+=1;
    }
    notifyListeners();
  }

  void previousOrder(){
    if(super.currentStationOrderIndex>0){
      currentStationOrderIndex-=1;
    }
    notifyListeners();
  }

  void bumpOrder(){
    completedOrders.add(stationOrderList[currentStationOrderIndex]);
    stationOrderList.removeAt(currentStationOrderIndex);
    if(currentStationOrderIndex==stationOrderList.length && stationOrderList.length!=0){
      currentStationOrderIndex-=1;
    }
    notifyListeners();
   }

   void recallOrder(){

     stationOrderList.length==0? stationOrderList.add(completedOrders.last):stationOrderList.insert(0, completedOrders.last);
     completedOrders.removeLast();
     notifyListeners();
   }

  void recallOrderByIndex(int index){
    stationOrderList.length==0? stationOrderList.add(completedOrders[index]):stationOrderList.insert(0, completedOrders[index]);
    completedOrders.removeAt(index);
    notifyListeners();
  }


  List<Dish> getDishForStation(Station station){
    List<Dish> dishList=[];
    for(var dishId in station.dishIdList){
      for(var dish in dishList){
        if(dishId==dish.id){
          dishList.add(dish);
        }
      }
    }
    return dishList;
  }
}
