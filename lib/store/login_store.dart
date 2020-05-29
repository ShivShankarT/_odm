import 'package:flutter/cupertino.dart';
import 'package:odm/models/login_response.dart';
import 'package:odm/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStore extends ChangeNotifier{
  bool isLoggingIn = false;
  String error;
  LoginData loginData;
  Future login(String username, String password, String mobile)async{
    setLoggingIn(true);
    LoginResponse loginResponse =
    await LoginService.login(user: username, password: password, mobile: mobile);
    if(loginResponse.error== true){
      error = "Username Password Mismatch";
      setLoggingIn(false);
    } else {

      loginData = loginResponse.data[0];
      print(loginData.toJson());
      SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
      await sharedPreferences.setString("Access_Token", loginData.accessToken);
      setLoggingIn(false);
    }
  }

  void setLoggingIn(bool loggingIn){
    isLoggingIn = loggingIn;
    notifyListeners();
  }
  reset(){
    isLoggingIn = false;
  }

}
enum LoginStatus{
  IDLE,
  LOGGING_IN,
  LOGGED_IN,
  ERROR
}