import 'package:flutter/cupertino.dart';
import 'package:odm/models/change_password_response.dart';
import 'package:odm/models/login_response.dart';
import 'package:odm/services/changer_password_service.dart';
import 'package:odm/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordStore extends ChangeNotifier{
  bool isLoggingIn = false;
  String error;
  Data changePassData;
  Future login(String username, String password, String mobile)async{
    setLoggingIn(true);
    ChangePasswordResponse changePasswordResponse;
    await ChangePasswordService.changePassword(currentPassword: username, newPassword: password, mobile: mobile);
    if(changePasswordResponse.error== true){
      error = " Password Mismatch";
      setLoggingIn(false);
    } else {

      changePassData = changePasswordResponse.data[0];
      print(changePassData.toJson());

      setLoggingIn(false);
    }
  }

  void setLoggingIn(bool loggingIn){
    isLoggingIn = loggingIn;
    notifyListeners();
  }

}
