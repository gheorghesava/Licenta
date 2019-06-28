import 'package:common_widgets/models/dish.dart';
import 'package:meta/meta.dart';

class StationOrder{
  int id;
  int stationId;
  int clientOrderId;
  int completionTime;
  List<Dish> dishList;

  StationOrder({
    @required this.id,
    @required this.stationId,
    @required this.clientOrderId,
    @required this.completionTime,
    @required this.dishList
  });

  static StationOrder fromMap(Map<String,dynamic> stationOrderMap){
    int compltime=0;
    (stationOrderMap["dishList"] as List).forEach((dish)=> compltime+=dish.cookTime);
    return StationOrder(
      id: stationOrderMap["id"],
      stationId: stationOrderMap["station"]["id"],
      clientOrderId: stationOrderMap["clientOrder"]["id"],
      completionTime: compltime,
      dishList: (stationOrderMap["dishList"] as List).map((dishMap)=>Dish.fromMap(dishMap)).toList()
      );
  }
}