import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:odm/models/invoice_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class InvoiceService{
  static const String otpUrl = "http://api.odm.esecdev.com/invoice/";
  static Future<InvoiceResponse> invoice()async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print("Quotation Service is running...");
    print("here is the AcessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result =await http.get(otpUrl,  headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return InvoiceResponse.fromJson(jsonDecode(result.body));
    return null;
  }


  static Future<InvoiceResponse> invoiceFilter(String query)async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result =await http.get(otpUrl+"?search=$query",  headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return InvoiceResponse.fromJson(jsonDecode(result.body));
    return null;
  }
}