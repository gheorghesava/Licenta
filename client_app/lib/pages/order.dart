import 'package:client_app/models/dish.dart';
import 'package:client_app/scoped_models/main_model.dart';
import 'package:client_app/widgets/dish_list.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final MainModel model;

  OrderPage(this.model);
  @override
  State<StatefulWidget> createState() {
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order list'),
        actions: <Widget>[
          FlatButton(
            child: Text('Place order'),
            onPressed:(){
              widget.model.sendOrder().then((result){
                if(result){
                  Navigator.pushReplacementNamed(context, '/home');
                }
              });

            }
          )
        ],
      ),
      body: DishList(widget.model.clientOrder.itemList),
      bottomSheet: ListTile(
          title: Text(
        'Total price: ' + widget.model.clientOrder.totalPrice.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
