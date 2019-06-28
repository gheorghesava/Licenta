import 'package:common_widgets/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/scoped_models/auth_mode.dart';
import 'package:restaurant_app/scoped_models/main_model.dart';
import 'package:restaurant_app/scoped_models/user_role.dart';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';

class AuthPage extends StatefulWidget {
  final MainModel _model;
  AuthPage(this._model);
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _phoneNumberController =
      new TextEditingController();
  int roleNr = -1;
  AuthMode _authMode = AuthMode.LoginMode;
  UserRole _userType = UserRole.Manager;
  List<String> restaurantNameList = [];
  String selectedRestaurantName;

  @override
  void initState() {
    super.initState();
    widget._model.getRestaurants().then((_) {
      restaurantNameList = widget._model.restaurantList
          .map((restaurant) => restaurant.name)
          .toList();
      selectedRestaurantName = restaurantNameList[0];
    });
  }

  _insuccessfulLoginDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(_authMode == AuthMode.LoginMode
                  ? 'Login failed'
                  : 'Signup failed'),
              content: Text('Username or/and password are incorrect.'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }

  Widget _buildTextFiled(String fieldname, TextEditingController controller,
      {bool isObscure = false}) {
    return TextFormField(
      validator: (String content) {
        if (content.isEmpty) {
          return fieldname + " is required";
        }
      },
      decoration: InputDecoration(labelText: fieldname),
      obscureText: isObscure,
      controller: controller,
    );
  }

  Widget _buildConfirmPasswordTextFiled() {
    return TextFormField(
      validator: (String content) {
        if (content.isEmpty) {
          return "Confirm password is required";
        }
        if (_passwordController.text != content)
          return "Confirm password don't match.";
      },
      decoration: InputDecoration(labelText: 'Confirm Password'),
      obscureText: true,
    );
  }

  Widget _buildRoleRadioButtons() {
    return Column(
      children: <Widget>[
        Text('Manager'),
        Radio(
          value: 0,
          groupValue: roleNr,
          onChanged: (int val) {
            setState(() {
              roleNr = val;
              this._userType = UserRole.Manager;
            });
          },
        ),
        Text('Cook'),
        Radio(
          value: 1,
          groupValue: roleNr,
          onChanged: (int val) {
            setState(() {
              roleNr = val;
              this._userType = UserRole.Cook;
            });
          },
        ),
        Text('Clerk'),
        Radio(
          value: 2,
          groupValue: roleNr,
          onChanged: (int val) {
            setState(() {
              roleNr = val;
              this._userType = UserRole.Clerk;
            });
          },
        ),
      ],
    );
  }

  Widget _buildRestaurantDropdownButton() {
    return DropdownButtonFormField(
      hint: Text("Select restaurant"),
      value: selectedRestaurantName,
      decoration: InputDecoration(labelText: "Restaurant"),
      onChanged: (restaurantName) {
        setState(() {
          selectedRestaurantName = restaurantName;
        });
      },
      items: restaurantNameList.map((restaurant) {
        return DropdownMenuItem<String>(
          value: restaurant,
          child: Text(restaurant),
        );
      }).toList(),
    );
  }

  Future<Null> _submitForm(MainModel model) async {
    if (!_formKey.currentState.validate() && roleNr == -1) return;
    int restaurantId;
    model.restaurantList.forEach((res) {
      if (res.name == selectedRestaurantName) {
        restaurantId=res.id;
      }
    });
    if(restaurantId==null) return;
    print(_emailController.text + '\n' + _passwordController.text+'\n'+restaurantId.toString()+'\n'+_userType.index.toString());
    bool result = this._authMode == AuthMode.LoginMode
        ? await model.authenticate({
            'email': _emailController.text.trim(),
            'password': _passwordController.text.trim()
          }, mode: this._authMode, userRole: this._userType)
        : await model.authenticate({
            'email': _emailController.text.trim(),
            'password': _passwordController.text.trim(),
            'username': _usernameController.text.trim(),
            'phoneNumber': _phoneNumberController.text.trim(),
            'restaurant': restaurantId,
          }, mode: this._authMode, userRole: this._userType);
    print(result);
    if (result) {
      Navigator.pushReplacementNamed(context, '/cook/home');
    } else {
      _insuccessfulLoginDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 400 : deviceWidth * 0.8;
    return Scaffold(
      appBar: AppBar(
          title: Text(
              _authMode == AuthMode.LoginMode ? 'Login Page' : 'Signup Page')),
      body: Center(
          child: Container(
              padding: EdgeInsets.all(50.0),
              child: Center(
                  child: SingleChildScrollView(
                child: Container(
                  width: targetWidth,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          _buildTextFiled("Email", _emailController),
                          SizedBox(
                            height: 10,
                          ),
                          _buildTextFiled("Password", _passwordController,
                              isObscure: true),
                          SizedBox(
                            height: 10,
                          ),
                          _authMode == AuthMode.SignupMode
                              ? _buildConfirmPasswordTextFiled()
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                          _authMode == AuthMode.SignupMode
                              ? _buildTextFiled("Username", _usernameController)
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                          _authMode == AuthMode.SignupMode
                              ? _buildRestaurantDropdownButton()
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                          _authMode == AuthMode.SignupMode
                              ? _buildTextFiled(
                                  "Phone number", _phoneNumberController)
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildRoleRadioButtons(),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                            child: Text(
                                "Switch to ${_authMode == AuthMode.LoginMode ? 'Signup mode' : 'Login mode'}"),
                            onPressed: () {
                              setState(() {
                                _authMode = _authMode == AuthMode.LoginMode
                                    ? AuthMode.SignupMode
                                    : AuthMode.LoginMode;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ScopedModelDescendant<MainModel>(builder:
                              (BuildContext context, Widget child,
                                  MainModel model) {
                            return RaisedButton(
                              child: Text(_authMode == AuthMode.LoginMode
                                  ? 'Login'
                                  : 'Signup'),
                              onPressed: () => _submitForm(model),
                            );
                          })
                        ],
                      )),
                ),
              )))),
    );
  }
}
