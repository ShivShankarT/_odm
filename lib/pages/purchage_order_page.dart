import 'package:flutter/material.dart';

import '../navigation_bloc.dart';
class PurchageOrderpage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Purchage Order" ,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),),

      ),
    );
  }
}
