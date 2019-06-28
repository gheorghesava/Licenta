import 'package:flutter/material.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class StationControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ButtonBar(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed:  model.previousOrder,
          ),
          RaisedButton(
            child: Text("BUMP"),
            color: Colors.green,
            onPressed: model.bumpOrder,
          ),
          RaisedButton(
            child: Text("RECALL"),
            color: Colors.red,
            onPressed: model.recallOrder,
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: model.nextOrder,
          )
        ],
      );
    });
  }
}
