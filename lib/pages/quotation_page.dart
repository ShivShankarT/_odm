import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:odm/login_screen.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/pages/widgets/flutter_search_delegate.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/splash_screen.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_search_bar.dart';

class QuotationPage extends StatefulWidget with NavigationStates {
  @override
  _QuotationPageState createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Quotation Search:'),
        actions: [searchBar.getSearchAction(context)]);
  }


  _QuotationPageState() {
    searchBar = new SearchBar(
        inBar: true,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar
    );
  }
  QuotationStore quotationStore=new QuotationStore();

  void onSubmitted(String value) {
    setState(() =>  quotationStore.filterQuotations(value));
  }


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: (){
                QuotationStore quotationStore = Provider.of<QuotationStore>(context, listen: false);
                showSearch(context: context, delegate: FlutterSearchDelegate(quotationStore)).then((value)  {
                  quotationStore.loadQuotations();
                });
              },
              child: Icon(Icons.search),
            )
          ],
        ),

      body: Consumer<QuotationStore>(
        builder: (context, store, _) {
          if(store.loading == false && store.quotationResponse == null){
            WidgetsBinding.instance.addPostFrameCallback((_){
              store.loadQuotations();
            });
          }
          if(store.error?.toLowerCase() == "invalid token."){
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
              await logout(context);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) => LoginScreen()
              ), (route) => false);
            });
          }
          return store.loading?
              SafeArea(child: Center(child: CircularProgressIndicator(),))
              : store.error!=null?Center(
            child: Text(store.error),
          )
              :Column(
                children: [

                  Center(

                    /*child: TextField(
                      textDirection: TextDirection.rtl,
                      onSubmitted: (s){
                        store.filterQuotations(s);
                      },
                    ),*/
                  ),

                  Expanded(
                    child: ListView.builder(
                          itemCount: store.quotationResponse.data.length,
                            itemBuilder: (context, index) => QuotationWidget(data: store.quotationResponse.data[index],),
          ),
                  ),
                ],
              );
        }
      ),
    );
  }


}
logout(BuildContext context) async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  var accessToken=sharedPreferences.getString("Access_Token");
  accessToken=null;
  QuotationStore quotationStore = Provider.of<QuotationStore>(context, listen: false);
  quotationStore.reset();
}



