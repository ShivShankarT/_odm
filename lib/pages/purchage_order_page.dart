import 'package:flutter/material.dart';
import 'package:odm/models/purchase_response.dart';
import 'package:odm/pages/purchase_details.dart';
import 'package:odm/pages/widgets/purchase_widget.dart';
import 'package:odm/search_delegate/purchase_search_delegate.dart';
import 'package:odm/store/purchase_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen.dart';
import '../navigation_bloc.dart';
class PurchageOrderpage extends StatefulWidget with NavigationStates {
  @override
  _PurchageOrderpageState createState() => _PurchageOrderpageState();
}

Future navigateToSubPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PurchaseDetails()));
}


class _PurchageOrderpageState extends State<PurchageOrderpage> {
  List<PurchaseOrderResponse> _listPurchseResponse = List<
      PurchaseOrderResponse>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Purchase Order")),
          actions: [
            InkWell(
              onTap: () {
                PurchaseStore purchaseStore =
                Provider.of<PurchaseStore>(context, listen: false);
                showSearch(
                    context: context,
                    delegate: PurchaseSearchDelegate(purchaseStore))
                    .then((value) {
                  purchaseStore.loadPurchase();
                });
              },
              child:IconButton(icon: Icon(Icons.search,color: Colors.white,),),
            )
          ],
        ),
      body: Consumer<PurchaseStore>(
          builder: (context, store, _) {
            if (store.loading == false && store.purchaseOrderResponse == null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                store.loadPurchase();
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
            return store.loading || store.purchaseOrderResponse == null ?
            Center(child: CircularProgressIndicator(),)
                : ListView.builder(
              itemCount: store.purchaseOrderResponse.data.length,
              itemBuilder: (context, index) =>
                  PurchaseWidget(
                    purchaseData: store.purchaseOrderResponse.data[index],),
            );
          }
      ),
    );
  }
}


logout(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString("Access_Token",null);
 print(" Purchase ORDER >>>>> I set access Token value : NULL");
  PurchaseStore purchaseStore =
  Provider.of<PurchaseStore>(context, listen: false);
  purchaseStore.reset();
}