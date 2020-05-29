import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odm/loader.dart';
import 'package:odm/otp_varification.dart';
import 'package:odm/store/login_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    myEmailController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
        builder: (context, store, widget) {
          if(store.loginData!=null){
            WidgetsBinding.instance.addPostFrameCallback((_){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_)=>OtpVerification()
              ));
            });
          } else if(store.error!=null){
            WidgetsBinding.instance.addPostFrameCallback((_){
              showSnack(store.error);
              store.error = null;
            });
          }
          return Scaffold(
            key: scaffoldKey,
              body: SingleChildScrollView(
                child: Center(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 100),
                              child: Image.asset("assets/img/logo_big.png"),
                            ),
                            SizedBox(height: 25.0),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) =>
                                  FocusScope.of(context)
                                      .nextFocus(),
                              controller: myEmailController,
                              style: style,
                              validator: (data){
                                if(data.trim().isEmpty)
                                  return "Invalid Username";
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: 'User Id',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22.0))),
                            ),
                            SizedBox(height: 25.0),
                            TextFormField(
                              obscureText: false,
                              controller: myPasswordController,
                              onFieldSubmitted: (_) =>
                                  FocusScope.of(context)
                                      .unfocus(),
                              style: style,
                              validator: (data){
                                if(data.trim().length<5)
                                  return "Password Invalid";
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22.0))),
                            ),
                            SizedBox(
                              height: 35.0,
                            ),
                         store.isLoggingIn ?Center(
                          child: CircularProgressIndicator(),)
                            :Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.blue,
                                child:  MaterialButton(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    minWidth: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    onPressed: ()  {
                                      login(store);
                                    })),
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        }
    );
  }
  void login(LoginStore loginStore) async{

    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    if(formKey.currentState.validate()) {
      String user = myEmailController.text.trim();
      String password = myPasswordController.text.trim();
      sharedPreferences.setString("PASSWORD", password);
      print(sharedPreferences.getString("PASSWORD"));

      loginStore.login(user, password, "1");
    }
  }

  void showSnack(String msg){
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
