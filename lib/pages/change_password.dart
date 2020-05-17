import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/services/changer_password_service.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChangePassword extends StatefulWidget with NavigationStates {

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  var currentPassword;
  var newPassword;
  var reEnterNewPassword;

  final currentPasswordController=TextEditingController();
  final newPasswordController=TextEditingController();
  final reEnterPasswordController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    currentPasswordController.dispose();
    newPasswordController.dispose();
    reEnterPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginButton = Material(
        elevation: 5.0,
        child: Container(
          color: Colors.blue,
          child: Container(
            width: 3*(MediaQuery.of(context).size.width)/4,
            child: MaterialButton(

                child: Text("Change Password",style: TextStyle(fontSize: 20,
                 color: Colors.white),
                ),
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () async {

                  setState(() {
                    currentPassword = currentPasswordController.text;
                    newPassword = reEnterPasswordController.text;
                    reEnterNewPassword=newPasswordController.text;
                    print(currentPassword);
                    print(newPassword);
                    print(reEnterNewPassword);
                  });

                  final x = await ChangePasswordService.changePassword(
                      currentPassword: currentPassword,
                      newPassword: newPassword,

                  );

                  print("here is the x valu");
                  print(x.toJson());
                  if (x != null) {
                    final error = x.error;
                    if (error == false) {

                      Alert(
                        context: context,
                        title: "RFLUTTER ALERT",
                        desc: "Flutter is better with RFlutter Alert.",
                        image: Image.asset("assets/success.png"),
                      ).show();

                      print("running changePassword screen .........");
                      Navigator.of(context)
                          .push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) =>
                        new SideBarLayout(),
                      )
                      );
                    }

                  }
                }
            ),
          ),
        ));
    var width =MediaQuery.of(context).size.width;
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
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
                        Text("Change Password",
                          style: TextStyle(fontSize: 22,height: 2),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
            ,
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width:3*width/4,
                    child: TextFormField(
                        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      controller: currentPasswordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                        ),
                        hintText: "Enter Current Password",
                      )


                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width:3*width/4,
                    child: TextFormField(
                        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        controller: newPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          hintText: "Enter New Password",

                        )


                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width:3*width/4,
                    child: TextFormField(
                        onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                        controller: reEnterPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          hintText: " ReEnter New Password",
                        )


                    ),
                  ),
                ),
                loginButton,
              ],
            ),
          ),
        ),
      );
  }


}
