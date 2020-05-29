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

class QuotationPage extends StatefulWidget with NavigationStates {
  @override
  _QuotationPageState createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Consumer<QuotationStore>(builder: (context, store, _) {
        if (store.loading == false && store.quotationResponse == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            store.loadQuotations();
          });
        }
        if (store.error?.toLowerCase() == "invalid token." || store.error == "Not logged in."  ) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await logout(context);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          });
        }
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

logout(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var accessToken = sharedPreferences.getString("Access_Token");
  accessToken = "1";
  QuotationStore quotationStore =
      Provider.of<QuotationStore>(context, listen: false);
    quotationStore.reset();
}
