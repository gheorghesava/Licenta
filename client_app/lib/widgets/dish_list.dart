import 'package:client_app/models/dish.dart';
import 'package:client_app/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DishList extends StatelessWidget{
  final List<Dish> dishList;

  DishList(this.dishList);

  Widget _buildDishCard(Dish dish,BuildContext context){
    return Card(
      child: Column(children: <Widget>[
        Image(image: AssetImage('assets/plate.jpg'),),
        Text(dish.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text('Price: '+dish.price.toString()),
        SizedBox(height: 10,),
        OutlineButton(
          child: Text('Select'),
          onPressed: (){
            ScopedModel.of<MainModel>(context).addDishToOrder(dish);
          },
        )
      ],),);
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dishList.length,
      itemBuilder: (BuildContext context, int index){
          return _buildDishCard(dishList[index],context);
      },
    );
  }
}