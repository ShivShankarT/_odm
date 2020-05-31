import 'dart:convert';
import 'dart:io';
import 'package:odm/models/logout_response.dart';
import 'package:odm/models/otp_response.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class LogoutService{
  static const String otpUrl = "http://api.odm.esecdev.com/logout";
  static Future<LogoutResponse> logout()async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print("here is the AcessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result =await http.post(otpUrl, headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return LogoutResponse.fromJson(jsonDecode(result.body));
    return null;
  }
}