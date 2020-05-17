import 'package:flutter/material.dart';
import 'package:odm/login_screen.dart';
import 'package:odm/services/otp_service.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/otp_response.dart';

class OtpVerification extends StatefulWidget {

  const OtpVerification({Key key}) : super(key: key);
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  var otp;
  final myOtpController = TextEditingController();

  @override
  void dispose() {
    myOtpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final otpField = TextField(
      controller: myOtpController,
      onSubmitted: (Text){
        otp=Text;
        print(otp);
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter OTP",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final submitOtpButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          setState(() {
            otp = myOtpController.text;
            print(otp);
          });
          final x =await OtpService.otp(
              otp: otp
              );
          print(x.toJson());
          if (x != null) {
            final error = x.error;
            if (error == false) {
              final data = x.data;

              if (data != null && data.length > 0)  {
                Data required = data[0];

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('FNAME',data[0].fname );
                prefs.setString('LNAME', data[0].lname);
                prefs.setString('EMAIL', data[0].email);



                print(required.toJson());
              }

              print("running otp screen .........");
              Navigator.of(context)
                  .push(MaterialPageRoute<Null>(
                builder: (BuildContext context) =>
                new SideBarLayout(),
              )
              );
            }

          }











        },
        child: Text("Submit",
            textAlign: TextAlign.center,
      ),
    ));

    return
      Scaffold(

        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  otpField,
                  SizedBox(
                    height: 35.0,
                  ),
                  submitOtpButon,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }



}
