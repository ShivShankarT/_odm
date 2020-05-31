import 'dart:convert';
import 'dart:io';
import 'package:odm/models/otp_response.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class OtpService{
  static const String otpUrl = "http://api.odm.esecdev.com/login/otp";
  static Future<OtpResponse> otp({String otp})async{
    final prefs = await SharedPreferences.getInstance();
    final   counter = prefs.getString('Access_Token');
    print("here is the AccessToken value : OTP Service");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };


    final Map<String, String> params = {
      "otp": otp,

    };
    final result =await http.post(otpUrl, body: params, headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return OtpResponse.fromJson(jsonDecode(result.body));
    return null;
  }
}