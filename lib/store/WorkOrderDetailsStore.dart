import 'package:flutter/material.dart';
import 'package:odm/models/work_order_details_response.dart';
import 'package:odm/services/work_order_details_service.dart';

class WorkOrderDetailsStore extends ChangeNotifier{
  bool loading = false;
  WorkOrderDetailsResponse workOrderDetailsResponse;
  Map<int, WODetailsData> cachedMap = {};
  int loadingId;
  String error;
  void loadWorkOrderDetails(int id)async{
    if(cachedMap[id]==null) {
      setLoading(true);
      loadingId = id;
      final workOrderDetailsData = await WorkOrderDetailsService.workOrderDetails(id);
      if (workOrderDetailsData == null) {
        error = "Some Error";
        loadingId = null;
        setLoading(false);
      } else {
        workOrderDetailsResponse = workOrderDetailsData;
        if (workOrderDetailsData.error) {
          error = workOrderDetailsData.message;
        } else {
          cachedMap[id] = workOrderDetailsResponse.data[0];
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