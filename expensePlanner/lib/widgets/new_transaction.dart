import 'dart:ffi';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amoutController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amoutController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amoutController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                  // onChanged: (val) {
                  //   amoutIput = val;
                  // },
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  onPressed: submitData,
                  textColor: Colors.purple,
                )
              ],
            )),
      ),
    );
  }
}
