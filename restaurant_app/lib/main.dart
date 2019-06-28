import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/auth.dart';
import 'package:restaurant_app/pages/clerk/home.dart';
import 'package:restaurant_app/pages/cook/completed_orders.dart';
import 'package:restaurant_app/pages/cook/home.dart';
import 'package:restaurant_app/pages/manager/home.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  MainModel _model = MainModel();

  @override
  void initState() {
    _model.getStations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _model,
      child: MaterialApp(
        title: 'RestaurantApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (BuildContext context) => AuthPage(_model),
          "/manager/home": (BuildContext context) => ManagerHomePage(),
          "/cook/home": (BuildContext context) => CookHomePage(_model),
          "/cook/completed": (BuildContext context) => CompletedOrdersPage(),
          "/clerk/home": (BuildContext context) => ClerkHomePage(),
        },
      ),
    );
  }
}
