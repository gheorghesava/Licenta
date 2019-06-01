import 'package:client_app/pages/auth.dart';
import 'package:client_app/pages/home.dart';
import 'package:client_app/pages/order.dart';
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
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/home': (BuildContext context) => HomePage(model),
          '/order': (BuildContext context) => OrderPage(model)
        },
      ),
    );
  }
}
