import 'package:flutter/material.dart';

class OrderPrice extends StatelessWidget {
  final String totalPrice;

  OrderPrice(this.totalPrice);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
      'Total price: ' + totalPrice,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
  }
}
