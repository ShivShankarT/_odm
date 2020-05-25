import 'package:flutter/material.dart';
import 'package:odm/models/purchase_details_response.dart';
import 'package:odm/models/quotation_details_response.dart';
import 'package:odm/services/purchase_details_service.dart';
import 'package:odm/services/quotation_details_service.dart';

class PurchaseDetailsStore extends ChangeNotifier{
  bool loading = false;
  PurchaseDetailsResponse purchaseDetailsResponse;
  Map<int, PurchaseDetailsData> cachedMap = {};
  int loadingId;
  String error;
  void loadPurchaseDetails(int id)async{
    if(cachedMap[id]==null) {
      setLoading(true);
      loadingId = id;
      final purchaseDetailsData = await PurchaseDetailsService.purchaseOrderDetails(id);
      if (purchaseDetailsData == null) {
        error = "Some Error";
        loadingId = null;
        setLoading(false);
      } else {
        purchaseDetailsResponse = purchaseDetailsData;
        if (purchaseDetailsData.error) {
          error = purchaseDetailsData.message;
        } else {
          cachedMap[id] = purchaseDetailsResponse.data[0];
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