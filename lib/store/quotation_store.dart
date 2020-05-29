import 'package:flutter/material.dart';
import 'package:odm/models/quotation_response.dart';
import 'package:odm/services/quotation_service.dart';

 class QuotationStore extends ChangeNotifier{
  bool loading = false;
  bool loadingSearch = false;
  String searchError;
  QuotationResponse quotationResponse;
  QuotationResponse filterResponse;
  String error;
  void loadQuotations()async{
    setLoading(true);
    error = null;
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
    setLoadingSearch(true);
    final quotationData =await QuotationService.quotationFilter(query);
    print(quotationData?.toJson());
    if(quotationData == null){
      searchError = "Some Error";
      setLoadingSearch(false);
    } else {
      searchError = null;
      filterResponse = quotationData;
      if(quotationData.error){
        searchError = quotationData.message;
      } else if(quotationData.data ==null || quotationData.data.isEmpty){
        searchError = quotationData.message;
      }
      setLoadingSearch(false);
    }
  }
  setLoading(bool _loading){
    loading = _loading;
    notifyListeners();
  }
  setLoadingSearch(bool _loading){
    loadingSearch = _loading;
    notifyListeners();
  }
  reset(){
    bool loading = false;
    bool loadingSearch = false;

  }
}