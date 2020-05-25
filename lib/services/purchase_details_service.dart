import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:odm/models/purchase_details_response.dart';
import 'package:odm/models/quotation_details_response.dart';
import 'package:odm/models/work_order_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PurchaseDetailsService{
  static const String purchaseUrl = "http://api.odm.esecdev.com/purchase/order/";
  static Future<PurchaseDetailsResponse> purchaseOrderDetails(int id)async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token') ?? 0;
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result = await http.get("$purchaseUrl$id", headers: headers);
    if (result.statusCode == 200 && result.body != null) {
      return PurchaseDetailsResponse.fromJson(jsonDecode(result.body));
    }
    return null;
  }
}