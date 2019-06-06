import 'package:client_app/models/client_order.dart';
import 'package:client_app/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(title: Text('Order history')),
        body: ListView(
          children: <Widget>[
            ExpansionTile(
              title: Text('Ongoing orders'),
              children: model.ongoingOrders
                  .map((ClientOrder order) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/logo.png'),
                        ),
                        title: Text(
                            '${model.findRestaurantById(order.restaurantId).name}'),
                        subtitle: Text(
                          '${order.status}',
                          style: TextStyle(
                              color: order.status == 'OPEN'
                                  ? Colors.green
                                  : Colors.yellow),
                        ),
                        trailing: Text('Price: ${order.totalPrice}'),
                      ))
                  .toList(),
            ),
            ExpansionTile(
              title: Text('Completed orders'),
              children: model.completedOrders
                  .map((ClientOrder order) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/logo.png'),
                        ),
                        title: Text(
                            '${model.findRestaurantById(order.restaurantId).name}'),
                        subtitle: Text('from: ${order.createdAt}'),
                        trailing: Text('Price: ${order.totalPrice}'),
                      ))
                  .toList(),
            )
          ],
        ),
      );
    });
  }
}
