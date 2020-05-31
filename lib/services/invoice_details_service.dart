import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:odm/models/invoice_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class InvoiceDetailsService{
  static const String otpUrl = "http://api.odm.esecdev.com/invoice/";
  static Future<InvoiceDetailsResponse> invoiceDetails(int id)async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print("Invoice Service is running...");
    print("here is the AcessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result = await http.get("$otpUrl$id", headers: headers);
    if (result.statusCode == 200 && result.body != null) {
      return InvoiceDetailsResponse.fromJson(jsonDecode(result.body));
    }
    return null;
  }
}