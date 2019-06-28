import 'package:flutter/material.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class DishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Add new dish"),
            onPressed: () {},
            color: Colors.green,
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: model.dishList.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: CircleAvatar(backgroundImage: AssetImage("assets/plate.jpg"),),
                title: Text(model.dishList[index].title),
                onTap: (){},
              );
            },
          )
        ],
      );
    });
  }
}
