import 'package:flutter/material.dart';
import 'package:odm/models/quotation_response.dart';
import 'package:odm/services/quotation_service.dart';

class QuotationStore extends ChangeNotifier{
  bool loading = false;
  QuotationResponse quotationResponse;
  String error;
  void loadQuotations()async{
    setLoading(true);
    final quotationData =await QuotationService.quotation();

    print(quotationData?.toJson());
    if(quotationData == null){
      error = "Some Error";
      setLoading(false);
    } else {
      quotationResponse = quotationData;
      if(quotationData.error){
        error = quotationData.message;
      }
      setLoading(false);
    }
  }
  void filterQuotations(String query)async{
    setLoading(true);
    final quotationData =await QuotationService.quotationFilter(query);

    print(quotationData?.toJson());
    if(quotationData == null){
      error = "Some Error";
      setLoading(false);
    } else {
      quotationResponse = quotationData;
      if(quotationData.error){
        error = quotationData.message;
      }
      setLoading(false);
    }
  }
  setLoading(bool _loading){
    loading = _loading;
    notifyListeners();
  }
}