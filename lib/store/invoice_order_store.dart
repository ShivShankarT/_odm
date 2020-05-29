import 'package:flutter/material.dart';
import 'package:odm/models/invoice_response.dart';
import 'package:odm/services/invoice_service.dart';

class InvoiceStore extends ChangeNotifier{
  bool loading = false;
  InvoiceResponse invoiceResponse;
  String error;

  bool loadingSearch=false;
  InvoiceResponse filterInvoiceResponse;
  String searchError;




  void loadInvoice()async{
    setLoading(true);
    final invoiceData =await InvoiceService.invoice();

    print(invoiceData?.toJson());
    if(invoiceData == null){
      error = "Some Error";
      setLoading(false);
    } else {
      invoiceResponse = invoiceData;
      if(invoiceData.error){
        error = invoiceData.message;
      }
      setLoading(false);
    }
  }

  void filterLoadInvoice(String query)async{
    setLoadingSearch(true);
    final invoiceData =await InvoiceService.invoiceFilter(query);
    print(invoiceData ?.toJson());
    if(invoiceData == null){
      searchError = "Some Error";
      setLoadingSearch(false);
    } else {
      searchError = null;
      filterInvoiceResponse = invoiceData;
      if(invoiceData.error){
        searchError = invoiceData.message;
      }  else if(invoiceData.invoiceData ==null || invoiceData.invoiceData.isEmpty){
        searchError = invoiceData.message;
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
}