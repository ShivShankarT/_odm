import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/services/otp_service.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:odm/splash_screen.dart';
import 'package:odm/store/login_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/otp_response.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  var otp;
  TextEditingController myOtpController;

  @override
  void initState() {
    myOtpController = TextEditingController(
        text: Provider.of<LoginStore>(context, listen: false).loginData.otp);
    super.initState();
  }

  @override
  void dispose() {
    myOtpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Center(child: Text("Sign In OTP")),
        ),
        body: Form(
          key: _globalKey,
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: myOtpController,
                      validator: (value) {
                        return value == '' ? "Enter Correct  Input" : null;
                      },
                      onFieldSubmitted: (Text) {
                        otp = Text;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "OTP",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () async {
                            SnackBar snackBar = new SnackBar(
                              content: Text(
                                  "Check Your Email."),
                            );

                          //  _scaffoldKey.currentState.removeCurrentSnackBar();
                            SharedPreferences sharedPref =
                                await SharedPreferences.getInstance();
                            String otpValue = sharedPref.getString("otp");

                            print("this otp is form response:");
                            print(otpValue);
                            print("this otp is form user Input:");
                            print(myOtpController.text);

                            if (_globalKey.currentState.validate()) {
                              if (otpValue != myOtpController.text) {
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                              }
                            }

                            setState(() {
                              otp = myOtpController.text;
                            });
                            final x = await OtpService.otp(otp: otp);
                            print(x.toJson());
                            if (x != null) {
                              final error = x.error;
                              if (error == false) {
                                final data = x.data;
                                if (data != null && data.length > 0) {
                                  Data required = data[0];
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('FNAME', data[0].fname);
                                  prefs.setString('LNAME', data[0].lname);
                                  prefs.setString('EMAIL', data[0].email);

                                  print(required.toJson());
                                }
                                print("OTP OTP OTP SCREEN >>>>>> screen .........");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SideBarScreen()),
                                 // (Route<dynamic> route) => false,
                                );
                                print("OTP OTP OTP SCREEN >>>>>> after Nagivator .........");

                              }
                              if(error==true && (otpValue == myOtpController.text) )
                                {
                                  _scaffoldKey.currentState.removeCurrentSnackBar();
                                  SnackBar otpExpieryMessage = new SnackBar(
                                    content: Text(
                                        "OTP has Expired ! Please Login Again."),
                                  );
                                  _scaffoldKey.currentState
                                      .showSnackBar(otpExpieryMessage);
                                }
                            }

                          },
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
