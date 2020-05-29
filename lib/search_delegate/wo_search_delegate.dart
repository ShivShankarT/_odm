import 'package:flutter/material.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/pages/widgets/work_order_widget.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:odm/store/work_order_store.dart';
import 'package:provider/provider.dart';

class WOSearchDelegate extends SearchDelegate{
  final WorkOrderStore store;
  WOSearchDelegate(this.store);
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
    store.filterQuotations(query);
    return Consumer<WorkOrderStore>(
      builder: (context, store, _){
        print(store.filterWOResponse);
        return store.loadingSearch ? Center(
          child: CircularProgressIndicator(),
        ):store.searchError!=null?
        Center(
          child: Text(store.searchError),
        )
            : ListView.builder(
          itemCount: store.filterWOResponse?.data?.length ?? 0,
          itemBuilder: (context, index) => WorkOrderWidget(workOrderData: store.filterWOResponse.data[index],),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
  }
}