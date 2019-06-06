import 'package:client_app/scoped_models/main_model.dart';
import 'package:client_app/widgets/dish_list.dart';
import 'package:client_app/widgets/ui_elements/order_price.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  List<Widget> _buildBarTabs(MainModel model) {
    return model.selectedRestaurant.dishTypeList
        .map((dishType) => Tab(text: dishType.name))
        .toList();
  }

  List<Widget> _buildBarTabViews(MainModel model) {
    return model.selectedRestaurant.dishTypeList
        .map((dishType) =>
            DishList(model.selectedRestaurant.getDishListByType(dishType)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return DefaultTabController(
          length: model.selectedRestaurant.dishTypeList.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text(model.selectedRestaurant.name),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_basket),
                  onPressed: () => model.clientOrder != null
                      ? Navigator.pushNamed(context, '/neworder')
                      : () {},
                )
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: _buildBarTabs(model),
              ),
            ),
            body: TabBarView(
              children: _buildBarTabViews(model),
            ),
            bottomSheet: OrderPrice(model.clientOrder != null
                ? model.clientOrder.totalPrice.toString()
                : '0'),
          ));
    });
  }
}
