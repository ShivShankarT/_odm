import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/services/logout_service.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:odm/store/login_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen.dart';
import '../navigation_bloc.dart';

class GoToLoginPage extends StatefulWidget with NavigationStates {
  @override
  _GoToLoginPageState createState() => _GoToLoginPageState();
}

class _GoToLoginPageState extends State<GoToLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        actionsPadding: EdgeInsets.fromLTRB(22,22,42,22),
        backgroundColor: Colors.blue,
        //content: Container(width: 200, height: 200, color: Colors.green),
        title: Center(child: Text("Logout ?",style: TextStyle(color: Colors.white),)),
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
                    LoginStore loginStore = Provider.of(context, listen: false);
                    loginStore.reset();
                    SharedPreferences sharedPref= await SharedPreferences.getInstance();
                    sharedPref.setString("userId", null);
                    sharedPref.setString("PASSWORD", null);
                    sharedPref.setString("Access_Token", null);
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                        builder: (_)=>LoginScreen()
                    ), (_)=>false);
                  }
                  if (error == true) {
                    LoginStore loginStore = Provider.of(context, listen: false);
                    loginStore.reset();
                    SharedPreferences sharedPref= await SharedPreferences.getInstance();
                    sharedPref.setString("userId", null);
                    sharedPref.setString("PASSWORD", null);
                    sharedPref.setString("Access_Token", null);
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                        builder: (_)=>LoginScreen()
                    ), (_)=>false);
                  }

                }
              },
              child: Text('Yes')),
        ],
      ),
    );
  }
}
