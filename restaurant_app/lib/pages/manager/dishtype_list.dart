import 'package:flutter/material.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class DishTypeList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Add dish type"),
            onPressed: () {},
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: model.dishtypeList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(model.dishtypeList[index].name),
              );
            },
          )
        ],
      );
    });
  }
}