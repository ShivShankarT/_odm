import 'package:flutter/material.dart';
import 'package:odm/models/quotation_response.dart';
import 'package:odm/models/work_order_response.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/pages/widgets/flutter_search_delegate.dart';
import 'package:odm/pages/widgets/quotation_widget.dart';
import 'package:odm/pages/widgets/work_order_details_wedget.dart';
import 'package:odm/pages/widgets/work_order_widget.dart';
import 'package:odm/search_delegate/wo_search_delegate.dart';

import 'package:odm/store/work_order_store.dart';
import 'package:provider/provider.dart';

class WorkOrderPage extends StatefulWidget with NavigationStates {
  @override
  _WorkOrderPageState createState() => _WorkOrderPageState();
}


Future navigateToSubPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => WorkOrderDetailsScreen()));
}

class _WorkOrderPageState extends State<WorkOrderPage> {

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
              WorkOrderStore workOrderStore =
              Provider.of<WorkOrderStore>(context, listen: false);
              showSearch(
                  context: context,
                  delegate: WOSearchDelegate(workOrderStore))
                  .then((value) {
                workOrderStore.loadWorkOrder();
              });
            },
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Consumer<WorkOrderStore>(
          builder: (context, store, _) {
            if(store.loading == false && store.workOrderResponse == null){
              WidgetsBinding.instance.addPostFrameCallback((_){
                store.loadWorkOrder();
              });
            }
            return store.loading || store.workOrderResponse == null?
            Center(child: CircularProgressIndicator(),)
                :ListView.builder(
              itemCount: store.workOrderResponse.data.length,
              itemBuilder: (context, index) => WorkOrderWidget(workOrderData: store.workOrderResponse.data[index],),
            );
          }
      ),
    );
  }


}



