import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/services/logout_service.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:odm/store/login_store.dart';
import 'package:provider/provider.dart';
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
    return Center(
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
          Container(
            width: 33,
          ),
          RaisedButton(onPressed: () {
            Navigator.of(context).pop();
               // (Route<dynamic> route) => false);


          }, child: Text('No'))
        ],
      ),
    );
  }
}
