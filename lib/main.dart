import 'package:flutter/material.dart';
import 'package:odm/splash_screen.dart';
import 'package:odm/store/invoice_order_store.dart';
import 'package:odm/store/login_store.dart';
import 'package:odm/store/purchase_store.dart';
import 'package:odm/store/quotation_details_store.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:odm/store/work_order_store.dart';
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
        ChangeNotifierProvider<QDetailsStore>(
          create: (_)=>QDetailsStore(),
        ),

        ChangeNotifierProvider<WorkOrderStore>(
          create: (_)=>WorkOrderStore(),
        ),

        ChangeNotifierProvider<PurchaseStore>(
          create: (_)=>PurchaseStore(),
        ),
        ChangeNotifierProvider<InvoiceStore>(
          create: (_)=>InvoiceStore(),
        )

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
