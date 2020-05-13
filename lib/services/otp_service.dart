import 'dart:convert';

import 'package:odm/models/login_response.dart';
import 'package:odm/models/otp_response.dart';
import 'package:odm/models/user.dart';
import 'package:http/http.dart'as http;
class OtpService{

  static const String otpUrl = "http://api.odm.esecdev.com/login/otp";
  static Future<OtpResponse> otp({String otp})async{
    final Map<String, String> headers = {
      "access_token": "xxxxxx"
    };
    final Map<String, String> params = {
      "otp": otp,

    };
    final result =await http.post(otpUrl, body: params);
    if(result.statusCode == 200 && result.body!=null)
      return OtpResponse.fromJson(jsonDecode(result.body));
    return null;
  }
}