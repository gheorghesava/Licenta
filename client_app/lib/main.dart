import 'package:client_app/pages/auth.dart';
import 'package:client_app/pages/dish.dart';
import 'package:client_app/pages/home.dart';
import 'package:client_app/pages/menu.dart';
import 'package:client_app/pages/new_order.dart';
import 'package:client_app/pages/order_history.dart';
import 'package:client_app/pages/profile.dart';
import 'package:client_app/pages/restaurant.dart';
import 'package:client_app/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    MainModel model=MainModel();
    return ScopedModel(
      model: model,
      child: MaterialApp(
        title: 'OrderMgmgt',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Color.fromRGBO(223, 101, 137, 100)
        ),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/home': (BuildContext context) => HomePage(),
          '/profile': (BuildContext context) => ProfilePage(),
          '/menu': (BuildContext context) => MenuPage(),
          '/neworder': (BuildContext context) => NewOrderPage(),
          '/history': (BuildContext context) => OrderHistoryPage(),
          '/restaurant': (BuildContext context) => RestaurantPage(),
          '/dish': (BuildContext context) => DishPage()
        },
      ),
    );
  }
}
