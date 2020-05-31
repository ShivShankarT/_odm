import 'dart:async';

import 'package:flutter/material.dart';
import 'package:odm/login_screen.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:odm/store/login_store.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<Timer> startTimer() async {
    var duration = Duration(seconds: 1);
    return Timer(duration, route);
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 200),
                child: Center(
                  child: Image.asset(
                    "assets/img/logo_big_splash.png",
                    width: 200,
                    height: 200,
                  ),
                )),
            // Loader(),
          ],
        ),
      ),
    );
  }

  Future route() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("Access_Token");
    print("HERE IS TOKEN VALUE splash screen:");
    print(token ?? "null token found");

    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => (token == null || isTokenValid()==true) ? Login() : SideBarLayout()
    )
    );
  }

  Future<bool> isTokenValid() async {
    bool value;
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    print("here is userId after logout:");
    print(sharedPref.getString("userId"));
    var splashUserId = sharedPref.getString("userID");
    var splashPasword = sharedPref.getString("PASSWORD");
    print("here is password after logout:");
    print(sharedPref.getString("PASSWORD"));



    // ignore: missing_return
    Consumer < QuotationStore > (builder: (context, store, _){
      if (store.error?.toLowerCase() == "invalid token." || store.error == "Not logged in.") {
        value= false;
      }});

    return value;
  }

}

