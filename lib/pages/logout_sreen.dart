import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/services/logout_service.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen.dart';
import '../navigation_bloc.dart';

class Logout extends StatefulWidget with NavigationStates {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AlertDialog(
            // content: Container(width: 200, height: 200, color: Colors.green),
            title: Center(child: Text("Logout ?")),
            actions: [
              RaisedButton(
                  onPressed: () async {
                    final x = await LogoutService.logout();
                    if (x.message == "Invalid token.") {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    }
                    if (x != null) {
                      final error = x.error;
                      if (error == false) {
                        SharedPreferences sharedPref= await SharedPreferences.getInstance();
                        sharedPref.setString("userId", null);
                        print("here is userId after logout:");
                        print(sharedPref.getString("userId"));
                        sharedPref.setString("PASSWORD", null);
                        print("here is password after logout:");
                        print(sharedPref.getString("PASSWORD"));

                        Navigator.popUntil(context, ModalRoute.withName('/login'));
                        print("running logout screen .........");
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        print("After log out I am setting access Token Null:");
                        sharedPreferences.setString("Access_Token", null);
                        print(sharedPreferences.getString("Access_Token"));
                      }
                    }
                  },
                  child: Text('Yes')),
              Container(
                width: 33,
              ),
              RaisedButton(onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SideBarScreen()));
                   // (Route<dynamic> route) => false);


              }, child: Text('No'))
            ],
          ),
        ),
      ),
    );
  }
}
