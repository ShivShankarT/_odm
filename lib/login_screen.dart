import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odm/otp_varification.dart';
import 'package:odm/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

    var emailField = TextFormField(
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      controller: myEmailController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    var passwordField = TextFormField(
      obscureText: false,
      controller: myPasswordController,
      onFieldSubmitted: (_) =>  FocusScope.of(context).unfocus(),
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
      color: Colors.blue,
      child: MaterialButton(
         child: Text("Login",

           style: TextStyle(
               fontSize: 20,
               color: Colors.white),
             ),
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {

          setState(() {
            userName = myEmailController.text;
            password = myPasswordController.text;
            print(userName);
            print(password);
          });

          final x = await LoginService.login(
              user: userName,
              password: password,
              mobile: "1"
          );

          print("here is the x valu");
          print(x.toJson());
          if (x != null) {
            final error = x.error;
            if (error == false) {

              final data = x.data;

              if (data != null && data.length > 0)  {

                LoginData required = data[0];

                print(required.toJson());
              }

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('OTP',data[0].otp );
                prefs.setString('Access_Token', data[0].accessToken);


              print("running push screen .........");
              Navigator.of(context)
                  .push(MaterialPageRoute<Null>(
                  builder: (BuildContext context) =>
                     new OtpVerification(),
                )
              );
            }

          }
        }
        ));

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