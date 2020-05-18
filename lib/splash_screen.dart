import 'package:odm/loader.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:odm/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final aboveSection = new Container(
    margin: EdgeInsets.only(top: 200),
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
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("Access_Token");
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => token == null ?Login():SideBarLayout()
    )
    );
  }
  initScreen(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            aboveSection,
            Loader()
          ],
        ),
      ),
        );
  }
}

