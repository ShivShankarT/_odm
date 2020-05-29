import 'package:flutter/material.dart';
import 'package:odm/pages/widgets/invoice_widget.dart';
import 'package:odm/search_delegate/invoice_search_delegate.dart';
import 'package:odm/store/invoice_order_store.dart';
import 'package:provider/provider.dart';

import '../navigation_bloc.dart';

class InvoiceScreen extends StatefulWidget with NavigationStates {


  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

Future navigateToSubPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => InvoiceScreen()));
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                InvoiceStore invoiceStore =
                Provider.of<InvoiceStore>(context, listen: false);
                showSearch(
                    context: context,
                    delegate: InvoiceSearchDelegate(invoiceStore))
                    .then((value) {
                  invoiceStore.loadInvoice();
                });
              },
              child: Icon(Icons.search),
            )
          ],
        ),

        body: Consumer<InvoiceStore>(
        builder: (context, store, _)
    {
      if (store.loading == false && store.invoiceResponse == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          store.loadInvoice();
        });
      }
      return store.loading || store.invoiceResponse == null ?
      Center(child: CircularProgressIndicator(),)
          : ListView.builder(
        itemCount: store.invoiceResponse.invoiceData.length,
        itemBuilder: (context, index) =>
            InvoiceWidget(data: store.invoiceResponse.invoiceData[index],),
      );
    }),
    );

  }
}
