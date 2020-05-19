import 'package:flutter/material.dart';
import 'package:odm/models/quotation_response.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/quotation_details.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';

class QuotationPage extends StatefulWidget with NavigationStates {
  @override
  _QuotationPageState createState() => _QuotationPageState();
}


Future navigateToSubPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => QuotationDetails()));
}

class _QuotationPageState extends State<QuotationPage> {
  List<QuotationResponse> _listQuotationResponse= List<QuotationResponse>();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<QuotationStore>(
      builder: (context, store, _) {
        if(store.loading == false && store.quotationResponse == null){
          WidgetsBinding.instance.addPostFrameCallback((_){
            store.loadQuotations();
          });
        }
        return store.loading || store.quotationResponse == null?
            Center(child: CircularProgressIndicator(),)
            :ListView.builder(
          itemCount: store.quotationResponse.data.length,
          itemBuilder: (context, index) => QuotationWidget(data: store.quotationResponse.data[index],),
        );
      }
    );
  }


}




