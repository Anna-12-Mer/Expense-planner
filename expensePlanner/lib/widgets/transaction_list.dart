import 'package:expensePlanner/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TansactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TansactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 2),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${transactions[index].amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  transactions[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ]));
        },
        itemCount: transactions.length,
      ),
    );
  }
}