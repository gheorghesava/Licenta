import 'package:client_app/models/restaurant.dart';
import 'package:client_app/pages/menu.dart';
import 'package:client_app/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  final MainModel model;
  HomePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.model.fetchRestaurants();
    super.initState();
  }

  Widget _buildRestaurantCard(Restaurant restaurant) {
    return Card(
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/logo.png'),
          ),
          Text(
            restaurant.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Wrap(
            children: <Widget>[
              Text(
                restaurant.address.address,
                textAlign: TextAlign.center,
              )
            ],
          ),
          SizedBox(height: 10.0),
          Wrap(
            children: <Widget>[
              OutlineButton(
                child: Text("Restaurant info"),
                onPressed: () {},
              ),
              SizedBox(
                width: 30.0,
              ),
              OutlineButton(
                child: Text("Menu"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => MenuPage(restaurant)));
                },
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        drawer: Drawer(
          child: Column(children: <Widget>[
            SizedBox(height: 50,),
            Text(model.authenticatedUser.username),
            SizedBox(height: 20,),
            Text(model.authenticatedUser.email),
            SizedBox(height:20),
            Text("Available sold: "+ model.authenticatedUser.sold.toString())
          ],),),
        appBar: AppBar(
          title: Text("Home page"),
        ),
        body: Container(
          child: RefreshIndicator(
            onRefresh: model.fetchRestaurants,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: model.restaurantList.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildRestaurantCard(model.restaurantList[index]);
              },
            ),
          ),
        ),
      );
    });
  }
}
