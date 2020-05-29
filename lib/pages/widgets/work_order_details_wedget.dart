import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:http/http.dart' as http;
import 'package:odm/models/quotation_details_response.dart';
import 'package:odm/models/work_order_details_response.dart';
import 'package:odm/pages/quotation_page.dart';
import 'package:odm/store/WorkOrderDetailsStore.dart';
import 'package:odm/store/quotation_details_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkOrderDetailsScreen extends StatefulWidget {
  final int id;
  final int size;

  const WorkOrderDetailsScreen({Key key, this.id, this.size}) : super(key: key);

  @override
  _WorkOrderDetailsScreenState createState() => _WorkOrderDetailsScreenState();
}

class _WorkOrderDetailsScreenState extends State<WorkOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkOrderDetailsStore>(builder: (context, store, _) {
      final WODetailsData data = store.cachedMap[widget.id];
      if (data == null && store.loadingId != widget.id && store.loading == false) store.loadWorkOrderDetails(widget.id);
      return Scaffold(
        body: store.loading && store.loadingId == widget.id ? Center(
          child: CircularProgressIndicator(),
        ) : data != null
            ? SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    new Container(
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                1.0, 6.0, 2.0, 6.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                                          builder: (context) =>
                                              QuotationPage()),
                                    );
                                  },
                                ),
                                Text(
                                  "Work Order Details",
                                  style: TextStyle(fontSize: 20),
                                ),
                                IconButton(
                                    icon: Icon(Icons.picture_as_pdf),
                                    iconSize: 30,
                                    color: Colors.white,
                                    ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 2.0, 12.0, 6.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${data.partyCompanyDisplay}' ?? "",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 2.0, 12.0, 6.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${data.pbSCity}' ?? "",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 6.0, 12.0, 6.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${data.currencySymbol} '' ${data.orderTotal}',
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 6.0, 12.0, 12.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                '${data.orderDate}' ?? " ",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 6.0, 12.0, 6.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${data.orderNo}' ?? " ",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: <Widget>[
                          smallCommon(
                              "SGST (${data.orderTaxPer}%)", "INR 1.05"),
                          smallCommon("CGST(3%)", "INR 1.05"),
                          smallCommon(
                            "Sub Total", '${data.currencySymbol}'?? " " ' ${data.orderSubTotal}' ?? " ",
                          ),
                          smallCommon(
                            "Discount",
                            '${data.currencySymbol}' ?? ""
                                ' '
                                '${data.orderDiscount}' ?? "",
                          ),
                          common(
                              "Total",
                              '${data.currencySymbol} ' ?? ""
                                  '${data.orderTotal}')?? ""
                        ],
                      ),
                    ),
                    Text(
                      "Item details ",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(18))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            if (data.items.length > 0)
                              common(
                                  data.items[0].oiName,
                                  '${data.currencySymbol} '
                                      ' '
                                      ' ${data.items[0].oiTotal}'),
                            if (data.items.length > 0)
                              smallCommon(
                                  ' ${data.items[0].oiDescription}',
                                  ""),
                            if (data.items.length > 1)
                              common(
                                  data.items[1].oiName,
                                  '${data.currencySymbol} '
                                      ' '
                                      ' ${data.items[1].oiTotal}'),
                            if (data.items.length > 1)
                              smallCommon(
                                  ' ${data.items[1].oiDescription}',
                                  ""),
                            if (data.items.length > 2)
                              common(
                                  data.items[2].oiName,
                                  '${data.currencySymbol} '
                                      ' '
                                      ' ${data.items[2].oiTotal}'),
                            if (data.items.length > 2)
                              smallCommon(
                                  ' ${data.items[2].oiDescription}',
                                  ""),
                            if (data.items.length > 3)
                              common(
                                  data.items[3].oiName,
                                  '${data.currencySymbol} '
                                      ' '
                                      ' ${data.items[3].oiTotal}'),
                            if (data.items.length > 3)
                              smallCommon(
                                  ' ${data.items[3].oiDescription}',
                                  ""),
                            if (data.items.length > 4)
                              common(
                                  data.items[4].oiName,
                                  '${data.currencySymbol} '
                                      ' '
                                      ' ${data.items[4].oiTotal}'),
                            if (data.items.length > 4)
                              smallCommon(
                                  ' ${data.items[4].oiDescription}',
                                  ""),
                            if (data.items.length > 5)
                              common(
                                  data.items[5].oiName,
                                  '${data.currencySymbol} '
                                      ' '
                                      ' ${data.items[5].oiTotal}'),
                            if (data.items.length > 5)
                              smallCommon(
                                  ' ${data.items[5].oiDescription}',
                                  ""),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
            : Center(
          child: Text("Error"),
        ),
      );
    });
  }

  common(String first, String second) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: Text(
                first,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )),
          Spacer(),
          Expanded(
              child: Text(
                second,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
        ],
      ),
    );
  }

  smallCommon(String first, String second) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Text(first)),
          Spacer(),
          Expanded(child: Text(second)),
        ],
      ),
    );
  }
}

