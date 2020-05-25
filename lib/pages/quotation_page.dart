import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/store/quotation_store.dart';
import 'package:provider/provider.dart';

class QuotationPage extends StatefulWidget with NavigationStates {
  @override
  _QuotationPageState createState() => _QuotationPageState();
}
class _QuotationPageState extends State<QuotationPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ArticleSearch());

              },
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
          return store.loading || store.quotationResponse == null?
              SafeArea(child: Center(child: CircularProgressIndicator(),))
              :Column(
                children: [
                  Center(
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      onSubmitted: (s){
                        store.filterQuotations(s);
                      },
                    ),
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

class ArticleSearch extends SearchDelegate{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          query='';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
return IconButton(
  icon: Icon(Icons.arrow_back),
  onPressed: (){
    close(context, null);
  },
);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text(query);
   // throw UnimplementedError();
  }
}




