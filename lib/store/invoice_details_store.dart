import 'package:flutter/material.dart';
import 'package:odm/models/invoice_details_response.dart';
import 'package:odm/models/quotation_details_response.dart';
import 'package:odm/services/invoice_details_service.dart';

class InvoiceDetailsStore extends ChangeNotifier{
  bool loading = false;
  InvoiceDetailsResponse invoiceDetailsResponse;
  Map<int, InvoiceDetailsData> cachedMap = {};
  int loadingId;
  String error;
  void loadInvoice(int id)async{
    if(cachedMap[id]==null) {
      setLoading(true);
      loadingId = id;
      final invoiceDetailsData = await InvoiceDetailsService.invoiceDetails(id);
      if (invoiceDetailsData == null) {
        error = "Some Error";
        loadingId = null;
        setLoading(false);
      } else {
        invoiceDetailsResponse = invoiceDetailsData;
        if (invoiceDetailsData.error) {
          error = invoiceDetailsData.message;
        } else {
          cachedMap[id] = invoiceDetailsResponse.invoiceDetailsdata[0];
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