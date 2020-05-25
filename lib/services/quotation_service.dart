import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:odm/models/quotation_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class QuotationService{
  static const String otpUrl = "http://api.odm.esecdev.com/quotation";
  static Future<QuotationResponse> quotation()async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token') ?? 0;
    print("Quotation Service is running...");
    print("here is the AcessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };


    final result =await http.get(otpUrl,  headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return QuotationResponse.fromJson(jsonDecode(result.body));
    return null;
  }
  static Future<QuotationResponse> quotationFilter(String query)async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token') ?? 0;
    print("Quotation Service is running...");
    print("here is the AcessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };


    final result =await http.get(otpUrl+"?search=$query",  headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return QuotationResponse.fromJson(jsonDecode(result.body));
    return null;
  }
}