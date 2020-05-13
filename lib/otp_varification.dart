import 'package:flutter/material.dart';
import 'package:odm/drawable_screen.dart';
import 'package:odm/services/otp_service.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  var otp;
  final myOtpControler=TextEditingController();


  @override
  Widget build(BuildContext context) {

    final otpField = TextField(
      controller: myOtpControler,
      obscureText: true,
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
            otp=myOtpControler.text;

          });
           final x =await OtpService.otp(
                 otp: otp
              );

             print("here is the otp valu");
                print(x.toJson());

          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new  DrawablePage();
          }));},
        child: Text("Submit OTP",
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
