import 'package:flutter/material.dart';
class MyCustomButton extends StatefulWidget {
  @override
  _MyCustomButtonState createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: RawMaterialButton(

          shape: RoundedRectangleBorder(side: BorderSide(width: 2),borderRadius: BorderRadius.circular(33)),
          fillColor: Colors.deepPurple,
          constraints:BoxConstraints(minWidth: 188.0, minHeight: 56.0),

        ),
      ),
    );
  }
}
