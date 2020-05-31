import 'package:flutter/material.dart';
import 'package:odm/models/purchase_response.dart';
import 'package:odm/services/purchase_sevices.dart';

class PurchaseStore extends ChangeNotifier{
  bool loading = false;
  bool searchLoading=false;
  PurchaseOrderResponse purchaseOrderResponse;
  PurchaseOrderResponse filterResponse;
  String error;
  String searchError;
  void loadPurchase()async{
    setLoading(true);
    final purchaseData =await PurchaseService().purchase();

    print(purchaseData?.toJson());
    if(purchaseData == null){
      error = "Some Error";
      setLoading(false);
    } else {
      purchaseOrderResponse = purchaseData;
      if(purchaseData.error){
        error = purchaseData.message;
      }
      setLoading(false);
    }
  }

  void filterPurchase(String query)async{
    setLoadingSearch(true);
    final purchaseData =await PurchaseService.purchaseOrderFilter(query);
    print(purchaseData?.toJson());
    if(purchaseData == null){
      searchError = "Some Error";
      setLoadingSearch(false);
    } else {
      searchError = null;
      filterResponse = purchaseData;
      if(purchaseData.error){
        searchError = purchaseData.message;
      } else if(purchaseData.data ==null || purchaseData.data.isEmpty){
        searchError = purchaseData.message;
      }
      setLoadingSearch(false);
    }
  }

  setLoading(bool _loading){
    loading = _loading;
    notifyListeners();
  }

  setLoadingSearch( bool _loading)
  {
    searchLoading=_loading;
    notifyListeners();
  }
  reset(){
    bool loading = false;
    bool loadingSearch = false;

  }
}