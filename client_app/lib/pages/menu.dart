import 'package:client_app/models/client_order.dart';
import 'package:client_app/models/restaurant.dart';
import 'package:client_app/scoped_models/main_model.dart';
import 'package:client_app/widgets/dish_list.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MenuPage extends StatefulWidget {
  final Restaurant restaurant;

  MenuPage(this.restaurant);

  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  List<Widget> _buildBarTabs() {
    return widget.restaurant.dishTypeList
        .map((dishType) => Tab(text: dishType.name))
        .toList();
  }

  List<Widget> _buildBarTabViews() {
    return widget.restaurant.dishTypeList
        .map((dishType) =>
            DishList(widget.restaurant.getDishListByType(dishType)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.restaurant.dishTypeList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.restaurant.name),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () => Navigator.pushNamed(context, '/order'),
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: _buildBarTabs(),
            ),
          ),
          body: TabBarView(
            children: _buildBarTabViews(),
          ),
        ));
  }
}
