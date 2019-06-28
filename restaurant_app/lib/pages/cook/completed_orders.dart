import 'package:flutter/material.dart';
import 'package:restaurant_app/models/station_order.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CompletedOrdersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompletedOrdersPageState();
  }
}

class _CompletedOrdersPageState extends State<CompletedOrdersPage> {

  Widget _buildOrderTile(MainModel model, int index){
    return ExpansionTile(
              title: Text("Order ID #${model.completedOrders[index].clientOrderId}"),
              trailing: RaisedButton(
                    child: Text("RECALL"),
                    color: Colors.red,
                    onPressed: () => model.recallOrderByIndex(index),
              ),
              children: model.completedOrders[index].dishList.map((dish){
                return ListTile(
                  title: Text(dish.title),
                );
              }).toList(),
            );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Completed Orders"),
        ),
        body: ListView.builder(
          itemCount: model.completedOrders.length,
          itemBuilder: (BuildContext context, int index)=> _buildOrderTile(model, index),
        ),
      );
    });
  }
}
