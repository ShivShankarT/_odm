import 'package:flutter/material.dart';
import 'package:odm/navigation_bloc.dart';
class Logout extends StatelessWidget  with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Logout:"),
      ),
    );
  }
}
