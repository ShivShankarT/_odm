import 'package:flutter/material.dart';
import 'package:odm/models/invoice_response.dart';
import 'package:odm/services/invoice_service.dart';

class InvoiceStore extends ChangeNotifier{
  bool loading = false;
  InvoiceResponse invoiceResponse;
  String error;
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
  setLoading(bool _loading){
    loading = _loading;
    notifyListeners();
  }
}