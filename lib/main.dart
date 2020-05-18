import 'package:flutter/material.dart';
import 'package:odm/splash_screen.dart';
import 'package:odm/store/login_store.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginStore>(
          create: (_)=>LoginStore(),
        ),
        ChangeNotifierProvider<QuotationStore>(
          create: (_)=>QuotationStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SplashScreen(),
      ),
    );
  }
}
