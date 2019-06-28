import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/models/station.dart';
import 'package:restaurant_app/pages/cook/station_control.dart';
import 'package:restaurant_app/pages/cook/station_order.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:restaurant_app/scoped_models/user_role.dart';
import 'package:scoped_model/scoped_model.dart';

class CookHomePage extends StatefulWidget {
  final MainModel model;

  CookHomePage(this.model);
  @override
  State<StatefulWidget> createState() {
    return _CookHomePageState();
  }
}

class _CookHomePageState extends State<CookHomePage> {
  @override
  void initState() {
    super.initState();
    widget.model.getStations();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(title: Text("Cook"),),
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
              model.subscribedStation == null
                  ? ExpansionTile(
                      title: Text('Subscribe to station'),
                      children: model.stationList.map((Station station) {
                        return ListTile(
                          title: Text(station.name),
                          onTap: () {
                            model.subscribeToStation(station);
                          },
                        );
                      }).toList())
                  : ListTile(
                      title:
                          Text("Subscribed to ${model.subscribedStation.name}"),
                      trailing: OutlineButton(
                        child: Text("Unsubscribe"),
                        onPressed: () {
                          model.disconnectFromStation(model.subscribedStation);
                        },
                      ),
                    ),
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
                leading: Icon(Icons.history),
                title: Text("Completed Orders"),
                onTap: () => Navigator.pushNamed(context, '/cook/completed'),
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
        body: StationOrderCard(),
        bottomSheet: StationControl(),
      );
    });
  }
}
