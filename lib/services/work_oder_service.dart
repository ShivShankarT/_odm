import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:odm/models/quotation_response.dart';
import 'package:odm/models/work_order_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class WorkOrderService{
  static const String otpUrl = "http://api.odm.esecdev.com/work/order";
  static Future<WorkOrderResponse> workOrder()async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print("WO Service is running ....");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result =await http.get(otpUrl,  headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return WorkOrderResponse.fromJson(jsonDecode(result.body));
    return null;
  }


  static Future<WorkOrderResponse> workOrderFilter(String query)async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result =await http.get(otpUrl+"?search=$query",  headers:headers);
    if(result.statusCode == 200 && result.body!=null)
      return WorkOrderResponse.fromJson(jsonDecode(result.body));
    return null;
  }
}