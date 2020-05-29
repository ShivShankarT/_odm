import 'package:flutter/material.dart';
import 'package:odm/pages/widgets/invoice_widget.dart';
import 'package:odm/pages/widgets/purchase_widget.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/store/invoice_order_store.dart';
import 'package:odm/store/purchase_store.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';

class InvoiceSearchDelegate extends SearchDelegate{
  final InvoiceStore store;
  InvoiceSearchDelegate(this.store);
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
    store.filterLoadInvoice(query);
    return Consumer<InvoiceStore>(
      builder: (context, store, _){
        print(store.filterInvoiceResponse);
        return store.loadingSearch ? Center(
          child: CircularProgressIndicator(),
        ):store.searchError!=null?
        Center(
          child: Text(store.searchError),
        )
            : ListView.builder(
          itemCount: store.filterInvoiceResponse?.invoiceData?.length ?? 0,
          itemBuilder: (context, index) => InvoiceWidget(data: store.filterInvoiceResponse.invoiceData[index],),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
  }
}