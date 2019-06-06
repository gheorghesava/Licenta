import 'package:client_app/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class RestaurantPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return Scaffold(
            appBar: AppBar(title: Text(model.selectedRestaurant.name),),
            body: Column(children: <Widget>[
              Hero(
                tag: model.selectedRestaurant.id,
                child: Image(image: AssetImage('assets/logo.png'),),
              ),
              ListTile(title:Text('Email',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text(model.selectedRestaurant.email),),
              ListTile(title:Text('Phone number',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text(model.selectedRestaurant.phoneNumber),),
              ListTile(title:Text('Address',style: TextStyle(fontWeight: FontWeight.bold),),subtitle: Text(model.selectedRestaurant.address.address),)
            ],),
          );
        });
  }
}