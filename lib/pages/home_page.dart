import 'package:flutter/material.dart';

import '../navigation_bloc.dart';
class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Home Page" ,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),),
    );
  }
}
