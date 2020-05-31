import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:odm/models/change_password_response.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/services/changer_password_service.dart';
import 'package:odm/sidebar/sidebar.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
GlobalKey<FormState> _confirmPasswordKey = GlobalKey<FormState>();


class ChangePassword extends StatefulWidget with NavigationStates {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {



  var _password;
  var _confirmPassword;
  var _sharedPrefPass;
  var _currentPassword;


  final _currentPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _currentPasswordFormSharedPref();
    super.initState();
    _currentPassword = _currentPasswordController.text.trim();
    _password = _passwordController.text.trim();
    _confirmPassword = _confirmPasswordController.text.trim();
  }
  void _currentPasswordFormSharedPref () async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    _sharedPrefPass= sharedPreferences.getString("PASSWORD");

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _currentPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.lightBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1.0, 6.0, 2.0, 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Change Password Page",
                              style: TextStyle(
                                  fontSize: 22,
                                  height: 2,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: 3 * width / 4,
                    child: TextFormField(
                      obscureText: true,
                        controller: _currentPasswordController,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context)
                                .nextFocus(),
                        validator: (data) {
                          if (data.trim().isEmpty) return "Invalid Input";
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: ' Current Password',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                        )),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: 3 * width / 4,
                    child: TextFormField(
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).nextFocus(),
                        controller: _passwordController,

                        validator: (value) {
                          return value == '' ? "Invalid Input" : null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                        )),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: 3 * width / 4,
                    child: TextFormField(
                      obscureText: true,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).unfocus(),
                        controller: _confirmPasswordController,
                        validator: (value) {
                          return value == '' ? "Invalid Input" : null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                        )),
                  ),
                ),
                Container(
                  child: Container(
                    width: 3 * (MediaQuery.of(context).size.width) / 4,
                    child: GestureDetector(
                      child: RaisedButton(
                        color: Colors.blue,
                          child: Text(
                            "Change Password",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () async {
                            if(_globalKey.currentState.validate())
                              {
                                _scaffoldKey.currentState.removeCurrentSnackBar();
                                String cc=_sharedPrefPass;
                                String bb=_currentPasswordController.text;
                                print(cc);
                                print(bb);

                                // ignore: unrelated_type_equality_checks
                                if(cc !=bb) {
                                  _scaffoldKey.currentState.removeCurrentSnackBar();


                                  print(' if(_sharedPrefPass != (_currentPasswordController.text != null)) {');
                                  print(_sharedPrefPass);
                                  print(_currentPasswordController.text);
                                  print(_passwordController.text);
                                  print(_confirmPasswordController.text);
                                    SnackBar snackBar= new SnackBar(content: Text("Incorrect Current Password!"),
                                    );
                                    _scaffoldKey.currentState.showSnackBar(snackBar);
                                  }
                                else if ( _passwordController.text !=_confirmPasswordController.text){
                                  _scaffoldKey.currentState.removeCurrentSnackBar();

                                  print('fale in  passwordController.text !=_confirmPasswordController.text');
                                  print(_sharedPrefPass);
                                  print(_currentPasswordController.text);
                                  print(_passwordController.text);
                                  print(_confirmPasswordController.text);

                                  SnackBar snackBar= new SnackBar(content: Text("Password & Current Password Mismatch"),);
                                  _scaffoldKey.currentState.showSnackBar(snackBar);
                                }

                                else if( _sharedPrefPass==_passwordController.text || _sharedPrefPass==_confirmPasswordController.text)
                                  {
                                    _scaffoldKey.currentState.removeCurrentSnackBar();

                                    SnackBar snackBar= new SnackBar(content: Text("New Password should be Different"),);
                                    _scaffoldKey.currentState.showSnackBar(snackBar);
                                  }
                                else {
                                  _scaffoldKey.currentState.removeCurrentSnackBar();
                                  changePassword(currentPassword: _currentPasswordController.text,newPassword: _passwordController.text,mobile: "1");
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => SideBarLayout()),
                                        (Route<dynamic> route) => false,
                                  );
                                  SnackBar snackBar= new SnackBar(content: Text("Password Updated:"),);
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>SideBar()));
                                  _scaffoldKey.currentState.showSnackBar(snackBar);
                                 // Navigator.pop(context,MaterialPageRoute(builder: (context)=> SideBar()));
                                }
                              }

                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const String otpUrl = "http://api.odm.esecdev.com/password";
  static Future<ChangePasswordResponse> changePassword({String currentPassword, String newPassword, String mobile})async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print("here is the AcessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };


    final Map<String, String> params = {
      "curr_password": currentPassword,
      "password":newPassword

    };
    final result =await http.post(otpUrl, body: params, headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return ChangePasswordResponse.fromJson(jsonDecode(result.body));
    return null;
  }

}
