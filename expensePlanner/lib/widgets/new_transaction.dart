import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amoutController = TextEditingController();

  final Function addTransaction;

  NewTransaction(this.addTransaction);
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
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amoutController,
                  // onChanged: (val) {
                  //   amoutIput = val;
                  // },
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  onPressed: () {
                    addTransaction(titleController.text,
                        double.parse(amoutController.text));
                  },
                  textColor: Colors.purple,
                )
              ],
            )),
      ),
    );
  }
}
