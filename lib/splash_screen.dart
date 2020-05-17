import 'package:odm/pages/change_password.dart';
import 'package:odm/pages/logout_sreen.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:odm/home_screen.dart';
import 'package:odm/login_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final aboveSection = new Container(
    margin: EdgeInsets.only(top: 250),
    child:Center(

       child: Image.asset("assets/img/logo_big_splash.png",width: 200,height: 200,),
    )
  );
  final belowSection = new Container(
    margin: EdgeInsets.only(top: 10),
    child:CircularProgressIndicator()

  );

  @override
  Widget build(BuildContext context){
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => ChangePassword()
    )
    );
  }
  initScreen(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[aboveSection,belowSection],
        ),
      ),
        );
  }
}

