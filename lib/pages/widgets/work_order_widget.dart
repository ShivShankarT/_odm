import 'package:flutter/material.dart';
import 'package:odm/models/work_order_response.dart';
import 'package:odm/pages/widgets/work_order_details_wedget.dart';

class WorkOrderWidget extends StatelessWidget{
  final WorkOrderData workOrderData;
  const WorkOrderWidget({Key key, this.workOrderData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      borderOnForeground: true,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WorkOrderDetailsScreen(id: workOrderData.orderId,),
              ));
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
                        ' ${workOrderData.partyCompany}',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
                      child: Text(
                        ' ${workOrderData.orderNo}',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        ' ${workOrderData.orderDate}',
                        style: TextStyle(fontSize: 15.0),
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
                        ' ${workOrderData.currencySymbol} ${workOrderData.orderTotal}',
                     style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                        ' ${workOrderData.statusName}',
                          style: TextStyle(color: Colors.blue),
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