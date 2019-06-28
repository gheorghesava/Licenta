import 'package:flutter/material.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class StationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Add station"),
            onPressed: () {},
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: model.stationList.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionTile(
                title: Text(model.stationList[index].name),
                children: model
                    .getDishForStation(model.stationList[index])
                    .map((dish) => ListTile(
                          title: Text(dish.title),
                          subtitle: Text("Dish type: ${dish.dishType.name}"),
                        ))
                    .toList(),
              );
            },
          )
        ],
      );
    });
  }
}
