import 'package:client_app/scoped_models/client_order_model.dart';
import 'package:client_app/scoped_models/connected_model.dart';
import 'package:client_app/scoped_models/restaurant_model.dart';
import 'package:client_app/scoped_models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with ConnectedModel, UserModel, RestaurantModel, ClientOrderModel{}