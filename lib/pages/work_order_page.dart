import 'package:flutter/material.dart';
import 'package:odm/navigation_bloc.dart';
class WorkOrderPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Work Order" ,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),),

      ),
    );
  }
}
