import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/services/changer_password_service.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChangePassword extends StatefulWidget with NavigationStates {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var passKey = GlobalKey<FormFieldState>();
  var currentPassword;
  var newPassword;
  var reEnterNewPassword;

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final reEnterPasswordController = TextEditingController();

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
    var width = MediaQuery.of(context).size.width;
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
                          Text(
                            "Change Password",
                            style: TextStyle(fontSize: 22, height: 2),
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
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).nextFocus(),
                      controller: currentPasswordController,
                      validator: (data){
                        if(data.trim().isEmpty)
                          return "Invalid Password";
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Current Password',
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
                    key: passKey,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).nextFocus(),
                      controller: newPasswordController,
                      decoration: InputDecoration( labelText: 'Enter New Password', border: OutlineInputBorder(
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
                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                      controller: reEnterPasswordController,
                      validator: (confirmation){
                        var password = passKey.currentState.value;
                        return equals(confirmation, password) ? null : "Confirm Password should match password";
                      },
                      decoration: InputDecoration(
                            labelText: 'ReEnter New Password',
                            border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(11)),
                        ),
                      )),
                ),
              ),
            RawMaterialButton(
              elevation: 5.0,
              child: Container(
                color: Colors.blue,
                child: Container(
                  width: 3 * (MediaQuery.of(context).size.width) / 4,
                  child: GestureDetector(
                    child: RawMaterialButton(
                        splashColor: Colors.yellow,
                        child: Text(
                          "Change Password",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () async {

                          setState(() {
                            currentPassword = currentPasswordController.text;
                            newPassword = reEnterPasswordController.text;
                            reEnterNewPassword = newPasswordController.text;
                          });
                          if((newPassword==reEnterNewPassword) && newPassword!=null && reEnterNewPassword!=null )
                          {

                            final x = await ChangePasswordService
                                .changePassword(
                              currentPassword: currentPassword,
                              newPassword: newPassword,
                            );
                            print(x.toJson());
                            if (x != null) {
                              final error = x.error;
                              if (error == false) {
                                Navigator.of(context).push(
                                    MaterialPageRoute<Null>(
                                      builder: (BuildContext context) =>
                                      new SideBarLayout(),
                                    ));
                              }
                            }
                          }
                          else if(newPassword !=reEnterNewPassword)
                            {
                              final snackBar = SnackBar(
                                content: Text('Password and ReEnter Password Mismatch!'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            }

                         else if(newPassword == '' || reEnterNewPassword==null)
                          {
                            final snackBar = SnackBar(
                              content: Text('Enter valid Password!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                          }


                        }),
                  ),
                ),
              ))           ],
          ),
        ),
      ),
    );
  }

  bool equals(String confirmation, password) {
  if(confirmation==password)
    return true;
  }
}
