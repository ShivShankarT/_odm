import 'package:flutter/material.dart';
import 'package:odm/navigation_bloc.dart';
import 'package:odm/quotation_details.dart';

class QuotationPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          elevation: 10,
          borderOnForeground: true,
          margin: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              navigateToSubPage(context);
            },
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
                              const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                          child: Text(
                            "shiv",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                          child: Text(
                            "Shankar",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                          child: Text(
                            "Tiwari",
                            style: TextStyle(fontSize: 18.0),
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
                            "INR 19",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Draft",
                              style: TextStyle(color: Colors.grey),
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
      },
      itemCount: 10,
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuotationDetails()));
  }
}
