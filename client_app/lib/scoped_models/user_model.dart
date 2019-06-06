import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:client_app/models/user.dart';
import 'package:client_app/scoped_models/auth_mode.dart';
import 'package:client_app/scoped_models/connected_model.dart';


mixin UserModel on ConnectedModel {
  Future<bool> authenticate(Map<String, dynamic> authData,
      {AuthMode mode = AuthMode.LoginMode}) async {
    String authPath = baseUrl +
        (mode == AuthMode.LoginMode
            ? "/auth/client/login"
            : "/auth/client/register");
    http.Response response = await http.post(authPath,
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode != 200 && response.statusCode != 201) return false;
    print(json.decode(response.body));
    authenticatedUser = User.fromMap(json.decode(response.body));
    return true;
  }

  void logout(){
    authenticatedUser=null;
    notifyListeners();
  }

  void updateUserInfo() async {
    http.Response response= await http.get(baseUrl+'/client/${authenticatedUser.id}');
    if (response.statusCode != 200 && response.statusCode != 201) return;
    authenticatedUser = User.fromMap(json.decode(response.body));
    notifyListeners();
  }

  User get authenticatedUser => super.authenticatedUser;

  
}
