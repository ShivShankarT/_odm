import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:odm/models/work_order_details_response.dart';
import 'package:odm/pages/quotation_page.dart';
import 'package:odm/services/quotation_details_service.dart';
import 'package:odm/store/WorkOrderDetailsStore.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class WorkOrderDetailsScreen extends StatefulWidget {
  final int id;
  final int size;
  const WorkOrderDetailsScreen({Key key,this.id, this.size}) : super(key: key);

  @override
  _WorkOrderDetailsScreenState createState() => _WorkOrderDetailsScreenState();
}

class _WorkOrderDetailsScreenState extends State<WorkOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkOrderDetailsStore>(

        builder: (context, store, _) {
          final WODetailsData data = store.cachedMap[widget.id];
          if(data == null && store.loadingId!=widget.id && store.loading == false)
            store.loadWorkOrderDetails(widget.id);
          return Scaffold(
            body: store.loading && store.loadingId == widget.id ? Center( child: CircularProgressIndicator(),) : data!=null?SafeArea(
              child: Container(
                child: Container(
                  child: Flexible(
                    child: Column(
                      children: <Widget>[
                        new Container(
                          color: Colors.lightBlue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(1.0, 6.0, 2.0, 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      icon: new Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => QuotationPage()),
                                        );
                                      },
                                    ),

                                    Text("Work Order Details"),
                                    IconButton(
                                        icon: Icon(Icons.picture_as_pdf),
                                        iconSize: 30,
                                        color: Colors.white,
                                        onPressed: () {
                                         /* QDetailsService.downloadPdf(widget.id);*/
                                        }

                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(data.partyCompanyDisplay)
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[Text(data.pbBCity)],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[Text('${data.currencySymbol} ' ' ${data.invoiceTotal}')],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[Text(data.orderDate)],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[Text(data.orderNo)],
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Card(
                          elevation: 10,
                          borderOnForeground: true,
                          margin: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 12.0, 12.0, 10.0),
                                          child: Text(
                                            "IGST(${data.orderTaxPer}%)",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 6.0, 12.0, 12.0),
                                          child: Text(
                                            "Sub Total",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 3.0, 12.0, 10.0),
                                          child: Text(
                                            "Discount",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              22.0, 6.0, 12.0, 20.0),
                                          child: Text(
                                            "Total",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            '${data.currencySymbol} ' ' ${data.orderTaxAmt}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${data.currencySymbol} ' ' ${data.orderSubTotal}',                                      style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${data.currencySymbol} ' ' ''${data.orderDiscount}',                                      style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20.0, 6.0, 12.0, 0.0),
                                            child: Text(
                                              '${data.currencySymbol} ' '${data.orderTotal}',                                      style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text("Item details " ),
                        new Card(
                          elevation: 10,
                          borderOnForeground: true,
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 12.0, 12.0, 10.0),
                                    child: Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          if(data.items.length>0)
                                            Text(
                                              data.items[0].oiName,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          if(data.items.length>0)
                                            Text(
                                              ' ${data.items[0].oiDescription}',
                                              style: TextStyle(fontSize: 18.0),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 0.0, 12.0, 24.0),
                                    child: Column(
                                      children: <Widget>[
                                        if(data.items.length>1)
                                          Text(
                                            data.items[1].oiName ,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        if(data.items.length>1)
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 30.0, 12.0, 24.0),

                                            child: Text(
                                              ' ${data.items[1].oiDescription}',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        if(data.items.length>3)
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20.0, 20.0, 12.0, 24.0),
                                            // data.iteam.length > 2 ? text() : sizedbox()
                                            child: Text(
                                              data.items[3].oiName,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        if(data.items.length>3)
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20.0, 20.0, 12.0, 0.0),
                                            child: Text(
                                              ' ${data.items[3].oiDescription}',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ):Center(child: Text("Error"),),
          );
        }
    );
  }
}
