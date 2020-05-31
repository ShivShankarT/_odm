import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:odm/models/quotation_details_response.dart';
import 'package:odm/models/work_order_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class WorkOrderDetailsService{
  static const String otpUrl = "http://api.odm.esecdev.com/work/order/";
  static Future<WorkOrderDetailsResponse> workOrderDetails(int id)async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print("Work Service is running...");
    print("here is the AcessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result = await http.get("$otpUrl$id", headers: headers);
    if (result.statusCode == 200 && result.body != null) {
      return WorkOrderDetailsResponse.fromJson(jsonDecode(result.body));
    }
    return null;
  }
}