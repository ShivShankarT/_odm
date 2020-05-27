import 'package:flutter/material.dart';
import 'package:odm/custom_button.dart';
import 'package:odm/pages/change_password.dart';
import 'package:odm/shared_pref_demo.dart';
import 'package:odm/splash_screen.dart';
import 'package:odm/store/WorkOrderDetailsStore.dart';
import 'package:odm/store/change_password_store.dart';
import 'package:odm/store/invoice_details_store.dart';
import 'package:odm/store/invoice_order_store.dart';
import 'package:odm/store/login_store.dart';
import 'package:odm/store/purchase_details_store.dart';
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
        ChangeNotifierProvider<ChangePasswordStore>(
          create: (_)=>ChangePasswordStore(),
        ),
        ChangeNotifierProvider<WorkOrderDetailsStore>(
          create: (_)=>WorkOrderDetailsStore(),
        ),
        ChangeNotifierProvider<InvoiceDetailsStore>(
          create: (_)=>InvoiceDetailsStore(),
        ),

        ChangeNotifierProvider<PurchaseStore>(
          create: (_)=>PurchaseStore(),
        ),
        ChangeNotifierProvider<PurchaseDetailsStore>(
          create: (_)=>PurchaseDetailsStore(),
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
        home:SplashScreen(

        ),
      ),
    );
  }
}
