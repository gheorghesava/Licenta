import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:client_app/models/client_order.dart';
import 'package:client_app/models/dish.dart';
import 'package:client_app/scoped_models/connected_model.dart';

mixin ClientOrderModel on ConnectedModel{
  void addDishToOrder(Dish dish) {
    if(clientOrder==null){
      clientOrder=ClientOrder(clientId: authenticatedUser.id, restaurantId: selectedRestaurant.id,itemList: []);
    }
    clientOrder.addDish(dish);
    notifyListeners();
  } 

  void removeDishFromOrder(Dish dish) {
    clientOrder.removeDish(dish);
    notifyListeners();
  }

  Future<bool> sendOrder() async {
    http.Response response= await http.post(
      baseUrl+'/client/order',
      body: json.encode(clientOrder.toMap()),
      headers: {'Content-Type': 'application/json'}
    );
    if (response.statusCode != 200 && response.statusCode != 201) return false;
    print(json.decode(response.body));
    clientOrder=null;
    notifyListeners();
    return true;
  }

  bool isOrderInitiated() => clientOrder!=null;

  ClientOrder get clientOrder => super.clientOrder;

  List<ClientOrder> get ongoingOrders {
    return authenticatedUser.orderList.where((ClientOrder order)=> order.status!='COMPLETED').toList();
  }

  List<ClientOrder> get completedOrders {
    return authenticatedUser.orderList.where((ClientOrder order)=> order.status=='COMPLETED').toList();
  }
}