import 'package:restaurant_app/scoped_models/connected_model.dart';
import 'package:restaurant_app/scoped_models/restaurant_model.dart';
import 'package:restaurant_app/scoped_models/station_model.dart';
import 'package:restaurant_app/scoped_models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with ConnectedModel, UserModel, StationModel, RestaurantModel{}