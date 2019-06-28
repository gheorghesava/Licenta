import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/widgets.dart';

class Station {
  int id;
  String name;
  List<int> dishIdList;

  Station({@required this.id, @required this.name});

  static Station fromMap(Map<String, dynamic> stationData) {
    return Station(
        id: stationData['id'],
        name: stationData['name'],
        );
  }
}
