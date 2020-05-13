import 'package:flutter/material.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
class DrawablePage extends StatefulWidget {
  @override
  _DrawablePageState createState() => _DrawablePageState();
}

class _DrawablePageState extends State<DrawablePage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SideBarLayout(),
    );
  }
}
