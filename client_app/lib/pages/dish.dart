import 'package:client_app/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DishPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DishPageState();
  }
}

class _DishPageState extends State<DishPage>{
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
          return Scaffold(
            appBar: AppBar(),
            body: Container(),
          );
        });
  }
}