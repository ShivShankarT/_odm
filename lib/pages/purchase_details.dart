import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/models/purchase_details_response.dart';
import 'package:odm/pages/quotation_page.dart';
import 'package:odm/store/purchase_details_store.dart';
import 'package:provider/provider.dart';

class PurchaseDetails extends StatefulWidget {
  final int id;
  final int size;

  const PurchaseDetails({Key key, this.id, this.size}) : super(key: key);

  @override
  _PurchaseDetailsState createState() => _PurchaseDetailsState();
}

class _PurchaseDetailsState extends State<PurchaseDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseDetailsStore>(
        builder: (context, store, _) {
          final PurchaseDetailsData data = store.cachedMap[widget.id];
          if (data == null && store.loadingId != widget.id &&
              store.loading == false)
            store.loadPurchaseDetails(widget.id);
          return Scaffold(
            body: store.loading && store.loadingId == widget.id ? Center(
              child: CircularProgressIndicator(),
            ) : data != null ? SafeArea(
              child: Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      new Container(
                        color: Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  1.0, 6.0, 2.0, 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
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

                                  Text(" Purchase Details"),
                                  Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.white,
                                    size: 30,
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
                                  Text( '${data.partyCompanyDisplay}')
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(data.ebBCity)],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('${data.currencySymbol}${data.porderTotal
                                     }')
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text('${data.porderDate}')],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text('${data.orderNo}')],
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 12.0, 12.0, 10.0),
                                        child: Text(
                                          "IGST(${data.porderTaxPer}%)",
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
                                          '${data.currencySymbol}${data
                                              .porderTaxAmt}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${data.currencySymbol}${data
                                                .porderSubTotal}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${data.currencySymbol}${data
                                                .porderDiscount}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20.0, 6.0, 12.0, 0.0),
                                          child: Text(
                                            '${data.currencySymbol}${data
                                                .porderTotal}', style: TextStyle(
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
                      Text(
                        "Item details ",
                      ),
                      new Card(
                        elevation: 10,
                        borderOnForeground: true,
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 12.0, 12.0, 10.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          data.items[0].poiName,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        if(data.items.length > 1)
                                          Text(
                                            '${data.items[0].poiDescription}',
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
                                      if(data.items.length > 1)
                                        Text(
                                         '${ data.items[1].poiName}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      if(data.items.length > 1)
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 30.0, 12.0, 24.0),
                                          child: Text(
                                           '${data.items[1].poiDescription}' ,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      if(data.items.length > 2)
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20.0, 20.0, 12.0, 24.0),
                                          child: Text(
                                            data.items[2].poiName,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      if(data.items.length > 2)
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20.0, 20.0, 12.0, 0.0),
                                          child: Text(
                                            '${data.items[2].poiDescription}',
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
            ) : Center(child: Text("Error"),),
          );
        }
    );
  }
}