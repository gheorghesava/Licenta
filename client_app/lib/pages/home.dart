import 'package:client_app/models/restaurant.dart';
import 'package:client_app/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() { 
    super.initState();
    // ScopedModel.of<MainModel>(context, rebuildOnChange: true).fetchRestaurants();
  }
  Widget _buildRestaurantCard(Restaurant restaurant, MainModel model) {
    return Card(
      child: Column(
        children: <Widget>[
          Hero(
            tag: restaurant.id,
            child: Image(
              image: AssetImage('assets/logo.png'),
              height: 150,
              width: 150,
            ),
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
                onPressed: () {
                  model.selectRestaurant(restaurant.id);
                  Navigator.pushNamed(context, '/restaurant')
                      .then((_) => model.selectRestaurant(null));
                },
              ),
              SizedBox(
                width: 30.0,
              ),
              OutlineButton(
                child: Text("Menu"),
                onPressed: () {
                  model.selectRestaurant(restaurant.id);
                  print(model.selectedRestaurant.name);
                  Navigator.pushNamed(context, '/menu')
                      .then((_) => model.selectRestaurant(null));
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
          child: Column(
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
                title: Text("Order history"),
                onTap: () => Navigator.pushNamed(context, '/history'),
              ),
              SizedBox(height: 10),
              ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout"),
                  onTap: () {
                    model.logout();
                    Navigator.pushReplacementNamed(context, '/');
                  })
            ],
          ),
        ),
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
                return _buildRestaurantCard(model.restaurantList[index], model);
              },
            ),
          ),
        ),
      );
    });
  }
}
