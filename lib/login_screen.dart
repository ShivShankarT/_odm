import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/otp_varification.dart';
import 'package:odm/services/login_service.dart';
import 'models/login_response.dart';


class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(title: 'Flutter Login'),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  var userName;
  var password;
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();


  @override
  void dispose() {
    myEmailController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var emailField = TextField(
      controller: myEmailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    var passwordField = TextField(
      obscureText: false,
      controller: myPasswordController,
      onSubmitted: (Text){
        password=Text;
        print(password);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {

         setState(() {
           userName=myEmailController.text;
           password=myPasswordController.text;
           print(userName);
           print(password);
         });
        /* final x =await LoginService.login(
             user: userName,
             password: password,
             mobile: "1"
         );
         print("here is the x valu");
         print(x.toJson());
         if(x!=null){
           var otp=x.data[1];

           print("this is opt:");
           print(otp);
           print("this is access token:");
           var accessToken=x.data[1];
           print(accessToken);
           final error=x.error;
         *//*  if(error==false)
             {*//*
               Navigator.of(context)
                   .push(MaterialPageRoute<Null>(
                    builder: (BuildContext context) {

                 return new OtpVerification();
               })
               );
             }
           final data = x.data;
           if(data!=null && data.length>0)
           {
             LoginData required = data[0];
             print(required.toJson());
             print("OTP"+required.otp);
           }*/

         Navigator.of(context)
             .push(MaterialPageRoute<Null>(
             builder: (BuildContext context) {return new OtpVerification();}
             ));

          },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                       Container( margin: EdgeInsets.only(top: 100),
                         child: Image.asset("assets/img/logo_big.png"),
                       ),
                    SizedBox(height: 25.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}