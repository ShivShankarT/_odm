import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;
import 'package:odm/models/quotation_details_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class QDetailsService {

  static const String otpUrl = "http://api.odm.esecdev.com/quotation/";

  static Future<QuotationDetailsResponse> quotationDetails(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print("Quotation Service is running...");
    print("here is the AccessToken value");
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };
    final result = await http.get("$otpUrl$id", headers: headers);
    if (result.statusCode == 200 && result.body != null) {
      return QuotationDetailsResponse.fromJson(jsonDecode(result.body));
    }
    return null;
  }


  static Future<QuotationDetailsResponse> quotationDetailsPdf(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print(counter);
    final Map<String, String> headers = {
      "access-token": counter
    };

    final result = await http.get("$otpUrl$id" + "pdf", headers: headers);
    if (result.statusCode == 200 && result.body != null) {

      print('pdf downloading:');

      return null;
    }
  }
}
