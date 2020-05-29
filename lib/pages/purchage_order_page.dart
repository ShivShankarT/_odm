import 'package:flutter/material.dart';
import 'package:odm/models/purchase_response.dart';
import 'package:odm/pages/purchase_details.dart';
import 'package:odm/pages/widgets/purchase_widget.dart';
import 'package:odm/search_delegate/purchase_search_delegate.dart';
import 'package:odm/store/purchase_store.dart';
import 'package:provider/provider.dart';

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
              child: Icon(Icons.search),
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
