import 'package:client_app/scoped_models/main_model.dart';
import 'package:client_app/widgets/dish_list.dart';
import 'package:client_app/widgets/ui_elements/order_price.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NewOrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewOrderPageState();
  }
}

class _NewOrderPageState extends State<NewOrderPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Order list'),
          actions: <Widget>[
            RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Place order'),
                onPressed: () {
                  if (model.clientOrder.itemList.length > 0) {
                    model.sendOrder().then((result) {
                      if (result) {
                        model.updateUserInfo();
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    });
                  }
                })
          ],
        ),
        body: DishList(model.clientOrder.itemList),
        bottomSheet: OrderPrice(model.clientOrder != null
            ? model.clientOrder.totalPrice.toString()
            : '0'),
      );
    });
  }
}
