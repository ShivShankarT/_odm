import 'dart:convert';
import 'dart:io';
import 'package:odm/models/change_password_response.dart';
import 'package:odm/models/otp_response.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class ChangePasswordService{
  static const String otpUrl = "http://api.odm.esecdev.com/password";
  static Future<ChangePasswordResponse> changePassword({String currentPassword, String newPassword, String mobile})async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token') ?? 0;
    print("here is the AcessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };


    final Map<String, String> params = {
      "curr_password": currentPassword,
      "password":newPassword

    };
    final result =await http.post(otpUrl, body: params, headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return ChangePasswordResponse.fromJson(jsonDecode(result.body));
    return null;
  }
}