import 'package:flutter/material.dart';

import '../navigation_bloc.dart';
class LogoutPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Logout" ,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),),

    );
  }
}
