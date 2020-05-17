import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odm/pages/quotation_page.dart';

class QuotationDetails extends StatefulWidget {
  @override
  _QuotationDetailsState createState() => _QuotationDetailsState();
}

class _QuotationDetailsState extends State<QuotationDetails> {
  @override
  Widget build(BuildContext context) {
    var rowOne = new Container(
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
                      MaterialPageRoute(builder: (context) => QuotationPage()),
                    );
                  },
                ),
                Text(" Quotation Details"),
                Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Sifty Technologies Limited It")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("uiop")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("INR 19")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("2020-05-13")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("QT0137")],
            ),
          ),
        ],
      ),
    );
    var rowTwo = new Card(
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
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 10.0),
                      child: Text(
                        "IGST(12.0%)",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        "Sub Total",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 3.0, 12.0, 10.0),
                      child: Text(
                        "Discount",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 6.0, 12.0, 20.0),
                      child: Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "INR 19.06",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "INR 18",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "INR 0",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 6.0, 12.0, 0.0),
                        child: Text(
                          "INR 20.16",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
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
    );
    var rowThree = new Card(
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
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "ONE",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "one",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "TWO",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "two",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 3.0, 12.0, 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Three",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "three",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 6.0, 12.0, 20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Four",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "four",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 24.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "INR 19.06",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 24.0),
                        child: Text(
                          "INR 18",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 12.0, 24.0),
                        child: Text(
                          "INR 0",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 12.0, 0.0),
                        child: Text(
                          "INR 20.16",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
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
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Container(
            child: Column(
              children: <Widget>[
                rowOne,
                rowTwo,
                Text(
                  "Item details ",
                ),
                rowThree,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
