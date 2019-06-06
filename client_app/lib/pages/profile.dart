import 'package:client_app/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your profile'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Hero(
              tag: 'profile',
              child: Center(
                child:Image(
                  image: AssetImage('assets/user.png'),
                  height: 170,
                  width: 170,
              )),
            ),
            SizedBox(height: 30,),
            ListTile(title:Text('Username',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text(model.authenticatedUser.username),),
            ListTile(title:Text('Email',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text(model.authenticatedUser.email),),
            ListTile(title:Text('Phone number',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text(model.authenticatedUser.phoneNumber),),
            ListTile(title:Text('Sold',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text(model.authenticatedUser.sold.toString()),)
          ],
        ),
      );
    });
  }
}
