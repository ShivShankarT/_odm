import 'package:flutter/material.dart';
import 'package:odm/navigation_bloc.dart';
class QuotationPage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Quotation" ,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),),

      ),
    );
  }
}
