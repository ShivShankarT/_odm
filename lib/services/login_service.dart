import 'dart:convert';

import 'package:odm/models/login_response.dart';
import 'package:odm/models/user.dart';
import 'package:http/http.dart'as http;
class LoginService{
  static const String loginUrl = "http://api.odm.esecdev.com/login";
  static Future<LoginResponse> login({String user, String password, String mobile})async{
    final Map<String, String> headers = {
      "Content-Type":"application/x-www-form-urlencoded"
    };
    final Map<String, String> params = {
      "user": user,
      "password": password,
      "mobile": "1"
    };
    final result =await http.post(loginUrl, body: params);
    if(result.statusCode == 200 && result.body!=null)
      return LoginResponse.fromJson(jsonDecode(result.body));
    return null;
  }
}