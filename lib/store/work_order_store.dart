import 'package:flutter/material.dart';
import 'package:odm/models/work_order_response.dart';
import 'package:odm/services/work_oder_service.dart';

class WorkOrderStore extends ChangeNotifier{
  bool loading = false;
  bool loadingSearch=false;
  String searchError;
  WorkOrderResponse workOrderResponse;
  WorkOrderResponse filterWOResponse;
  String error;
  void loadWorkOrder()async{
    setLoading(true);
    final workOrderData =await WorkOrderService.workOrder();
    if(workOrderData == null){
      error = "Some Error";
      setLoading(false);
    } else {
      workOrderResponse = workOrderData;
      if(workOrderData.error){
        error = workOrderData.message;
      }
      setLoading(false);
    }
  }
  void filterQuotations(String query)async{
    setLoadingSearch(true);
    final workOrderData =await WorkOrderService.workOrderFilter(query);
    print(workOrderData?.toJson());
    if(workOrderData == null){
      searchError = "Some Error";
      setLoadingSearch(false);
    } else {
      searchError = null;
      filterWOResponse = workOrderData;
      if(workOrderData.error){
        searchError = workOrderData.message;
      } else if(workOrderData.data ==null || workOrderData.data.isEmpty){
        searchError = workOrderData.message;
      }
      setLoadingSearch(false);
    }
  }

  setLoadingSearch(bool _loading){
    loadingSearch = _loading;
    notifyListeners();
  }
  setLoading(bool _loading){
    loading = _loading;
    notifyListeners();
  }
}