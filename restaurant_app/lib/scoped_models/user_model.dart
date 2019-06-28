import 'dart:convert';

import 'package:restaurant_app/models/manager.dart';
import 'package:restaurant_app/scoped_models/auth_mode.dart';
import 'package:restaurant_app/scoped_models/connected_model.dart';
import 'package:restaurant_app/scoped_models/user_role.dart';
import 'package:http/http.dart' as http;

mixin UserModel on ConnectedModel{
  Future<bool> authenticate(Map<String, dynamic> authData,{AuthMode mode, UserRole userRole}) async {
    String roleUri;
    if(userRole==UserRole.Manager){
      super.userRole=UserRole.Manager;
      super.currentRole=UserRole.Manager;
      roleUri='manager';
    }else if(userRole==UserRole.Cook){
      super.userRole=UserRole.Cook;
      roleUri='cook';
    }else if(userRole==UserRole.Clerk){
      super.userRole=UserRole.Clerk;
      roleUri='clerk';
    }
    String authPath = baseUrl +
        (mode == AuthMode.LoginMode
            ? "/auth/$roleUri/login"
            : "/auth/$roleUri/register");
    http.Response response = await http.post('$authPath',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'});
    print('ok1');
    if (!(response.statusCode == 200 || response.statusCode == 201)){
      super.userRole=null;
      super.currentRole=null;
      return false;
    } 
    print('ok');
    authenticatedUser = Manager.fromMap(json.decode(response.body));
    return true;
  }

  UserRole get userRole => super.userRole;

  UserRole get currentRole => super.currentRole;

  void switchRole(UserRole role){
    this.currentRole=role;
    print('intra'+role.toString());
    notifyListeners();
  }

  void logout(){
    authenticatedUser=null;
    notifyListeners();
  }

}