import 'package:flutter/material.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class StationOrderCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StationOrderState();
  }
}

class _StationOrderState extends State<StationOrderCard> {


  String convertToTime(int time){
    int hour=0;
    int min=0;
    int sec=0;
    if(time>=3600){
      hour=time~/3600;
      time=time%3600;
    }
    min=time~/60;
    sec=time%60;
    return "$hour:$min:$sec";
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return model.stationOrderList.length == 0
          ? Center(
              child: Text("No orders"),
            )
          : Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Order ID #${model.currentStationOrder.clientOrderId} ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "Total cook time: ${convertToTime(model.currentStationOrder.completionTime)}"),
                  ),
                  Divider(
                    color: Colors.blue,
                  ),
                  ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: model.currentStationOrder.dishList.map((dish) {
                      return ListTile(
                        title: Text(dish.title),
                        subtitle: Text("Cook time: ${convertToTime(dish.cookTime)}"),
                      );
                    }).toList(),
                  )
                ],
              ),
            );
    });
  }
}
