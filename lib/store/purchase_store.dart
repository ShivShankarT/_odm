import 'package:flutter/material.dart';
import 'package:odm/models/purchase_response.dart';
import 'package:odm/services/purchase_sevices.dart';

class PurchaseStore extends ChangeNotifier{
  bool loading = false;
  PurchaseOrderResponse purchaseOrderResponse;
  String error;
  void loadPurchase()async{
    setLoading(true);
    final puchaseData =await PurchaseService().purchase();

    print(puchaseData?.toJson());
    if(puchaseData == null){
      error = "Some Error";
      setLoading(false);
    } else {
      purchaseOrderResponse = puchaseData;
      if(puchaseData.error){
        error = puchaseData.message;
      }
      setLoading(false);
    }
  }
  setLoading(bool _loading){
    loading = _loading;
    notifyListeners();
  }
}