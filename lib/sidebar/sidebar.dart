import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odm/login_screen.dart';
import 'package:odm/models/otp_response.dart';
import 'package:odm/services/logout_service.dart';
import 'package:odm/sidebar/sidebar_layout.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu_item.dart';
import '../navigation_bloc.dart';


class SideBar extends StatefulWidget  {
  var myName=TextEditingController();
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>  {

  var name;
  final profile=new Container (
    child: ListTile(
      title: Text ('name'),
      subtitle: Text(
        "shiv.shankar@esecforte.com",
        style: TextStyle(
          color: Color(0xFF1BB5FD),
          fontSize: 15,
        ),
      ),
      leading: CircleAvatar(
        child: Icon(
          Icons.perm_identity,
          color: Colors.white,
        ),
        radius: 40,
      ),
    ),
  );
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void setState(fn)  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    name = prefs.getString('FNAME');
    print(name);
    super.setState(fn);
  }
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
     isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>  (
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned (
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: const Color(0xFF262AAA),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        child:  profile,
                      ),
                      Divider(
                        height: 60,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.format_quote,
                        title: "Quotations",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyQuotationClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.business_center,
                        title: "Work Orders",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyWorkOrdersClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.event_note,
                        title: "Purchase Order",

                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyPurchaseOrderClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.note,
                        title: "Invoices",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyInvoicesClickedEvent);
                        },
                      ),

                      MenuItem(
                        icon: Icons.settings_applications,
                        title: "Change Password",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyChangePasswordClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                        onTap: () {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "Do You Want To Logout !",
                            desc: "Flutter is more awesome with RFlutter Alert.",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "NO",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(116, 116, 191, 1.0),
                                  Color.fromRGBO(52, 138, 199, 1.0)
                                ]),
                              ),
                              DialogButton(
                                child: Text(
                                  "YES",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => _logout(),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(116, 116, 191, 1.0),
                                  Color.fromRGBO(52, 138, 199, 1.0)
                                ]),
                              )
                            ],
                          ).show();
                          onIconPressed(
                          );
                        /*  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyLogoutClickedEvent);*/
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _logout() async {
    final x = await LogoutService.logout();
    print("here is the x valu");
    print(x.toJson());
    if (x != null) {
      final error = x.error;
      if (error == false) {
        print("running changePassword screen .........");
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute<Null>(
          builder: (BuildContext context) =>
          new Login(),
        ),(_)=>false
        );
      }

    }
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}