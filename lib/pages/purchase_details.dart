import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:odm/models/purchase_details_response.dart';
import 'package:odm/pages/quotation_page.dart';
import 'package:odm/store/purchase_details_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen.dart';

class PurchaseDetails extends StatefulWidget {
  final int id;
  final int size;

  const PurchaseDetails({Key key, this.id, this.size}) : super(key: key);

  @override
  _PurchaseDetailsState createState() => _PurchaseDetailsState();
}

class _PurchaseDetailsState extends State<PurchaseDetails> {
  String pathPDF = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createFileOfPdfUrl(widget.id).then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
  }

  static const String otpUrl = "http://api.odm.esecdev.com/purchase/order/";

  Future<File> createFileOfPdfUrl(id) async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('Access_Token');
    print(counter);
    final Map<String, String> headers = {"access-token": counter};

    print("here is header:");
    print(headers);
    //   final result = await http.get("$otpUrl$id" + "pdf", headers: headers);
    //  if (result.statusCode == 200 && result.body != null) {
    print("Downloading...");
    final url = '$otpUrl$id' '/pdf';
    // final url="http://api.odm.esecdev.com/quotation/153/pdf";
    //  final url = "http://africau.edu/images/default/sample.pdf";

    print(url);
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    request.headers.set("access-token", counter);
    // final result = await HttpClient().addCredentials(url, realm, credentials);
    // final response = await http.get("$otpUrl$id" + "pdf", headers: headers);

    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    print(file);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseDetailsStore>(builder: (context, store, _) {
      final PurchaseDetailsData data = store.cachedMap[widget.id];
      if (data == null &&
          store.loadingId != widget.id &&
          store.loading == false) store.loadPurchaseDetails(widget.id);

      if (store.error?.toLowerCase() == "invalid token." ||
          store.error == "Not logged in.") {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await logout(context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
        });
      }

      return Scaffold(
        body: store.loading && store.loadingId == widget.id ? Center(
                child: CircularProgressIndicator(),
              )
            : data != null
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
                                            "Purchase Order Details",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.picture_as_pdf),
                                              iconSize: 30,
                                              color: Colors.white,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PDFScreen(pathPDF)),
                                                );
                                              }),
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
                                            '${data.partyCompanyDisplay}',
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
                                            '${data.pbCity}',
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
                                            '${data.currencySymbol} '
                                            ' ${data.porderTotal}',
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
                                            data.porderDate,
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
                                            '${data.porderNo}',
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
                                    smallCommon("SGST(${data.porderTaxPer}%)",
                                        "INR 1.05"),
                                    smallCommon("CGST(3%)", "INR 1.05"),
                                    smallCommon(
                                      "Sub Total",
                                      '${data.currencySymbol} '
                                          ' ${data.porderSubTotal}',
                                    ),
                                    smallCommon(
                                      "Discount",
                                      '${data.currencySymbol} '
                                          ' '
                                          '${data.porderDiscount}',
                                    ),
                                    common(
                                        "Total",
                                        '${data.currencySymbol} '
                                            '${data.porderTotal}')
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
                                            data.items[0].poiName,
                                            '${data.currencySymbol} '
                                            ' '
                                            ' ${data.items[0].poiTotal}'),
                                      if (data.items.length > 0)
                                        smallCommon(
                                            ' ${data.items[0].poiDescription}',
                                            ""),
                                      if (data.items.length > 1)
                                        common(
                                            data.items[1].poiName,
                                            '${data.currencySymbol} '
                                            ' '
                                            ' ${data.items[1].poiTotal}'),
                                      if (data.items.length > 1)
                                        smallCommon(
                                            ' ${data.items[1].poiDescription}',
                                            ""),
                                      if (data.items.length > 2)
                                        common(
                                            data.items[2].poiName,
                                            '${data.currencySymbol} '
                                            ' '
                                            ' ${data.items[2].poiTotal}'),
                                      if (data.items.length > 2)
                                        smallCommon(
                                            ' ${data.items[2].poiDescription}',
                                            ""),
                                      if (data.items.length > 3)
                                        common(
                                            data.items[3].poiName,
                                            '${data.currencySymbol} '
                                            ' '
                                            ' ${data.items[3].poiTotal}'),
                                      if (data.items.length > 3)
                                        smallCommon(
                                            ' ${data.items[3].poiDescription}',
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

class PDFScreen extends StatelessWidget {
  String pathPDF = "";

  PDFScreen(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}
