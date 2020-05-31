import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:odm/models/purchase_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PurchaseService {
  static const String otpUrl = "http://api.odm.esecdev.com/purchase/order";
  // ignore: missing_return
  Future<PurchaseOrderResponse> purchase() async{
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
      return PurchaseOrderResponse.fromJson(jsonDecode(result.body));

  }
  static Future<PurchaseOrderResponse> purchaseOrderFilter(String query)async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result =await http.get(otpUrl+"?search=$query",  headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return PurchaseOrderResponse.fromJson(jsonDecode(result.body));
    return null;
  }


 }