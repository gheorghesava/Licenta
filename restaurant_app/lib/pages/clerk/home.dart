import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:restaurant_app/scoped_models/user_role.dart';
import 'package:scoped_model/scoped_model.dart';

class ClerkHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Clerk home'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Hero(
                tag: 'profile',
                child: Image(
                  image: AssetImage('assets/user.png'),
                  height: 130,
                  width: 130,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              model.userRole == UserRole.Manager
                  ? ExpansionTile(
                      title: Text('Switch role'),
                      children: <Widget>[
                        ListTile(
                          title: Text('Manager'),
                          onTap: () {
                            model.switchRole(UserRole.Manager);
                            Navigator.pushReplacementNamed(
                                context, '/manager/home');
                          },
                        ),
                        ListTile(
                          title: Text('Cook'),
                          onTap: () {
                            model.switchRole(UserRole.Clerk);
                            Navigator.pushReplacementNamed(
                                context, '/cook/home');
                          },
                        )
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Your profile"),
                onTap: () => Navigator.pushNamed(context, '/profile'),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout"),
                  onTap: () {
                    model.logout();
                    Navigator.pushReplacementNamed(context, '/');
                  }),
              SizedBox(height: 35.0),
              
            ],
          ),
        ),
      );
    });
  }
}
