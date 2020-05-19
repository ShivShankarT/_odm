import 'package:flutter/material.dart';
import 'package:odm/models/work_order_response.dart';
import 'package:odm/services/work_oder_service.dart';

class WorkOrderStore extends ChangeNotifier{
  bool loading = false;
  WorkOrderResponse workOrderResponse;
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
  setLoading(bool _loading){
    loading = _loading;
    notifyListeners();
  }
}