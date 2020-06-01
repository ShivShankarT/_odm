import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/login_screen.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/search_delegate/flutter_search_delegate.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/splash_screen.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu_item.dart';
import 'go_to_home.dart';

class QuotationPage extends StatefulWidget with NavigationStates {
  @override
  _QuotationPageState createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Quotations")),
        actions: [
          InkWell(
            onTap: () {
              QuotationStore quotationStore =
                  Provider.of<QuotationStore>(context, listen: false);
              showSearch(
                      context: context,
                      delegate: FlutterSearchDelegate(quotationStore))
                  .then((value) {
                quotationStore.loadQuotations();
              });
            },
            child: IconButton(
              icon: Icon(Icons.search,color: Colors.white,),),
          ),
        ],
      ),
      body: Consumer<QuotationStore>(builder: (context, store, _) {
        if (store.loading == false && store.quotationResponse == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            store.loadQuotations();
          });
        }
       /* if (store.error?.toLowerCase() == "invalid token." || store.error == "Not logged in."  ) {
          logoutForQuotation(context);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (_)=>LoginScreen()
          ), (_)=>false);
        }*/
        return store.loading
            ? SafeArea(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            : store.error != null
                ? Center(
                    child: Text(store.error),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: store.quotationResponse.data.length,
                          itemBuilder: (context, index) => QuotationWidget(
                            data: store.quotationResponse.data[index],
                          ),
                        ),
                      ),
                    ],
                  );
      }),
    );
  }
}

logoutForQuotation(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("Access_Token",null);
  sharedPreferences.setString("userId", null);
  sharedPreferences.setString("PASSWORD", null);

  print(" Purchase ORDER >>>>> I set access Token value : NULL");
  QuotationStore quotationStore =
  Provider.of<QuotationStore>(context, listen: false);
  quotationStore.reset();
}