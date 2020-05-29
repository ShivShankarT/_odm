import 'package:flutter/material.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';

class FlutterSearchDelegate extends SearchDelegate{
  final QuotationStore store;
  FlutterSearchDelegate(this.store);
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
    return Consumer<QuotationStore>(
      builder: (context, store, _){
        print(store.filterResponse);
        return store.loadingSearch ? Center(
          child: CircularProgressIndicator(),
        ):store.searchError!=null?
            Center(
              child: Text(store.searchError),
            )
            : ListView.builder(
          itemCount: store.filterResponse?.data?.length ?? 0,
          itemBuilder: (context, index) => QuotationWidget(data: store.filterResponse.data[index],),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
  }
}