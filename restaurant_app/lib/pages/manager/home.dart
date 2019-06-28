import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/pages/manager/dish_list.dart';
import 'package:restaurant_app/pages/manager/station_list.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:restaurant_app/scoped_models/user_role.dart';
import 'package:scoped_model/scoped_model.dart';

import 'dishtype_list.dart';

class ManagerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 3,
          child: Scaffold(
            drawer: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
            return  Drawer(
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
                              title: Text('Cook'),
                              onTap: () {
                                model.switchRole(UserRole.Manager);
                                Navigator.pushReplacementNamed(
                                    context, '/cook/home');
                              },
                            ),
                            ListTile(
                              title: Text('Clerk'),
                              onTap: () {
                                model.switchRole(UserRole.Clerk);
                                Navigator.pushReplacementNamed(
                                    context, '/clerk/home');
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
            );
            }),
            appBar: AppBar(
              title: Text('Manager home'),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text("Dishes"),
                  ),
                  Tab(
                    child: Text("Dish types"),
                  ),
                  Tab(
                    child: Text("Stations"),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                DishList(),
                DishTypeList(),
                StationList(),
              ],
            ),
          ));
  }
}
