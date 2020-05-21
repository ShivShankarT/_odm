/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/pages/quotation_page.dart';
import 'package:odm/pages/widgets/quotation_details_widget.dart';
import 'package:odm/store/q_details_store.dart';
import 'package:provider/provider.dart';

class QuotationDetails extends StatefulWidget {
  @override
  _QuotationDetailsState createState() => _QuotationDetailsState();
}

class _QuotationDetailsState extends State<QuotationDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<QDetailsStore>(
        builder: (context, store, _) {
          if(store.loading == false && store.quotationDetailsResponse == null){
            WidgetsBinding.instance.addPostFrameCallback((_){
              store.loadQuotationsDetails();
            });
          }
          return store.loading || store.quotationDetailsResponse == null?
          Center(child: CircularProgressIndicator(),)
              :ListView.builder(
            itemCount: store.quotationDetailsResponse.data.length,
            itemBuilder: (context, index) => QDetailsWidget(id: ,),
          );
        }
    );


  }
}
*/
