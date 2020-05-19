import 'package:flutter/material.dart';
import 'package:odm/models/quotation_response.dart';
import 'package:odm/models/work_order_response.dart';

class WorkOrderWidget extends StatelessWidget{
  final WorkOrderData data;
  const WorkOrderWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
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
                      const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                      child: Text(
                        ' ${data.quotationNo  ?? "Empty"}',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        ' ${data.quotationNo  ?? "Empty"}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        ' ${data.quotationNo  ?? "Empty"}',
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
                       /* "INR ${data.quotationNo}",*/
                        ' ${data.quotationNo  ?? "Empty"}',
                     style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                        ' ${data.quotationNo  ?? "Empty"}',
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

  }}