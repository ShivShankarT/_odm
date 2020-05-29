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
      final WODetailsData woDetailsData = store.cachedMap[widget.id];
      if (woDetailsData == null && store.loadingId != widget.id && store.loading == false) store.loadWorkOrderDetails(widget.id);
      return Scaffold(
        body: store.loading && store.loadingId == widget.id ? Center(
          child: CircularProgressIndicator(),
        ) : woDetailsData != null
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
                                SizedBox(
                                  width: 5.0,
                                  height: 1,
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
                                  '${woDetailsData.partyCompanyDisplay}' ?? "",
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
                                  '${woDetailsData.pbSCity}' ?? "",
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
                                  '${woDetailsData.currencySymbol} '' ${woDetailsData.orderTotal}',
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
                                '${woDetailsData.orderDate}' ?? " ",
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
                                  '${woDetailsData.orderNo}' ?? " ",
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
                              "SGST (${woDetailsData.orderTaxPer}%)", "INR 1.05"),
                          smallCommon("CGST(3%)", "INR 1.05"),
                          smallCommon(
                            "Sub Total", '${woDetailsData.currencySymbol}'?? " " ' ${woDetailsData.orderSubTotal}' ?? " ",
                          ),
                          smallCommon(
                            "Discount",
                            '${woDetailsData.currencySymbol}' ?? ""
                                ' '
                                '${woDetailsData.orderDiscount}' ?? "",
                          ),
                          common(
                              "Total",
                              '${woDetailsData.currencySymbol} ' ?? ""
                                  '${woDetailsData.orderTotal}')?? ""
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
                            if (woDetailsData.items.length > 0)
                              common(
                                  woDetailsData.items[0].oiName,
                                  '${woDetailsData.currencySymbol} '
                                      ' '
                                      ' ${woDetailsData.items[0].oiTotal}'),
                            if (woDetailsData.items.length > 0)
                              smallCommon(
                                  ' ${woDetailsData.items[0].oiDescription}',
                                  ""),
                            if (woDetailsData.items.length > 1)
                              common(
                                  woDetailsData.items[1].oiName,
                                  '${woDetailsData.currencySymbol} '
                                      ' '
                                      ' ${woDetailsData.items[1].oiTotal}'),
                            if (woDetailsData.items.length > 1)
                              smallCommon(
                                  ' ${woDetailsData.items[1].oiDescription}',
                                  ""),
                            if (woDetailsData.items.length > 2)
                              common(
                                  woDetailsData.items[2].oiName,
                                  '${woDetailsData.currencySymbol} '
                                      ' '
                                      ' ${woDetailsData.items[2].oiTotal}'),
                            if (woDetailsData.items.length > 2)
                              smallCommon(
                                  ' ${woDetailsData.items[2].oiDescription}',
                                  ""),
                            if (woDetailsData.items.length > 3)
                              common(
                                  woDetailsData.items[3].oiName,
                                  '${woDetailsData.currencySymbol} '
                                      ' '
                                      ' ${woDetailsData.items[3].oiTotal}'),
                            if (woDetailsData.items.length > 3)
                              smallCommon(
                                  ' ${woDetailsData.items[3].oiDescription}',
                                  ""),
                            if (woDetailsData.items.length > 4)
                              common(
                                  woDetailsData.items[4].oiName,
                                  '${woDetailsData.currencySymbol} '
                                      ' '
                                      ' ${woDetailsData.items[4].oiTotal}'),
                            if (woDetailsData.items.length > 4)
                              smallCommon(
                                  ' ${woDetailsData.items[4].oiDescription}',
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

