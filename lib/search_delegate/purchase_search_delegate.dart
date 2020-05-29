import 'package:flutter/material.dart';
import 'package:odm/pages/widgets/purchase_widget.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/store/purchase_store.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';

class PurchaseSearchDelegate extends SearchDelegate{
  final PurchaseStore store;
  PurchaseSearchDelegate(this.store);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          close(context, null);
        },
      )
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildResults(BuildContext context) {
    store.filterPurchase(query);
    return Consumer<PurchaseStore>(
      builder: (context, store, _){
        print(store.filterResponse);
        return store.searchLoading ? Center(
          child: CircularProgressIndicator(),
        ):store.searchError!=null?
        Center(
          child: Text(store.searchError),
        )
            : ListView.builder(
          itemCount: store.filterResponse?.data?.length ?? 0,
          itemBuilder: (context, index) => PurchaseWidget(purchaseData: store.filterResponse.data[index],),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
  }
}