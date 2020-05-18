import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  final double initialRadius=50;
  double radius=75.0;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 6));
    animation_radius_in=Tween<double>(
      begin: 0,
      end: 1).animate(CurvedAnimation(parent: controller,curve: Interval(0.75,1,curve: Curves.elasticIn)));
   animation_rotation=Tween<double>(begin: 0.0,end: 1.0).animate( CurvedAnimation(parent: controller,curve: Interval(0.0,1.0,curve: Curves.linear)));
    animation_radius_out= Tween<double>(begin: 0,
        end: 1).animate(CurvedAnimation(parent: controller,curve: Interval(0.0,0.25,curve: Curves.elasticOut)));
    controller.addListener((){
     setState(() {
       if(controller.value>=0.75 && controller.value<=1.0)
       {
         radius=animation_radius_in.value*initialRadius;

       }
       else if(controller.value>=0.0 && controller.value<=0.25){
         radius=animation_radius_out.value*initialRadius;

       }
     });
    });
   controller.repeat();
        }

@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100,
        height: 100,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 35,
                color: Colors.greenAccent,
              ),
              Transform.translate(
                  offset: Offset( radius*cos(pi/4) ,radius*sin(pi/4) ),
           child: Dot(
             radius: 5,
             color: Colors.redAccent,
           )

           ,),
              Transform.translate(
                offset: Offset( radius*cos(pi/4) ,radius*sin(pi/4) ),
                child: Dot(
                  radius: 5,
                  color: Colors.blue,
                )

                ,),

              Transform.translate(
                offset: Offset( radius*cos(2*pi/4) ,radius*sin(2*pi/4) ),
                child: Dot(
                  radius: 5,
                  color: Colors.green,
                )

                ,),

              Transform.translate(
                offset: Offset( radius*cos(3*pi/4) ,radius*sin(3*pi/4) ),
                child: Dot(
                  radius: 5,
                  color: Colors.deepPurple,
                )

                ,),

              Transform.translate(
                offset: Offset( radius*cos(4*pi/4) ,radius*sin(4*pi/4) ),
                child: Dot(
                  radius: 5,
                  color: Colors.yellow,
                )

                ,),

              Transform.translate(
                offset: Offset( radius*cos(5*pi/4) ,radius*sin(5*pi/4) ),
                child: Dot(
                  radius: 5,
                  color: Colors.cyanAccent,
                )

                ,),

              Transform.translate(
                offset: Offset( radius*cos(6*pi/4) ,radius*sin(6*pi/4) ),
                child: Dot(
                  radius: 5,
                  color: Colors.yellow,
                )

                ,),

              Transform.translate(
                offset: Offset( radius*cos(7*pi/4) ,radius*sin(7*pi/4) ),
                child: Dot(
                  radius: 5,
                  color: Colors.redAccent,
                )

              ),
              Transform.translate(
                offset: Offset( radius*cos(8*pi/4) ,radius*sin(8*pi/4) ),
                child: Dot(
                  radius: 5,
                  color: Colors.black,
                )

                ,)


            ],
          ),
        ),
      ),
    );
  }
}
class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  Dot({this.color,this.radius});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}

