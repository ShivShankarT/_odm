import 'package:flutter/material.dart';

import '../navigation_bloc.dart';
class InvoiceScreen extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Invoice Page" ,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),),

      ),
    );
  }
}
