import 'package:flutter/material.dart';
import 'package:odm/models/quotation_Details_response.dart';
import 'package:odm/services/quotation_details_service.dart';

class QDetailsStore extends ChangeNotifier{
  bool loading = false;
  QuotationDetailsResponse quotationDetailsResponse;
  Map<int, QDetailsData> cachedMap = {};
  int loadingId;
  String error;
  void loadQuotations(int id)async{
    if(cachedMap[id]==null) {
      setLoading(true);
      loadingId = id;
      final quotationDetailsData = await QDetailsService.quotationDetails(id);
      if (quotationDetailsData == null) {
        error = "Some Error";
        loadingId = null;
        setLoading(false);
      } else {
        quotationDetailsResponse = quotationDetailsData;
        if (quotationDetailsData.error) {
          error = quotationDetailsData.message;
        } else {
          cachedMap[id] = quotationDetailsResponse.data[0];
        }
        loadingId = null;
        setLoading(false);
      }
    }
  }


  setLoading(bool _loading){
    loading = _loading;
    notifyListeners();
  }
}