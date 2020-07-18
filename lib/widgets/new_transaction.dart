import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime selectedDate;

  void _submitData() {
    if (amountController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate==null) {
      return;
    }
    widget.addTx(
      ////here we can use the property of another class by calling widget
      enteredTitle,
      enteredAmount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentdatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate=pickedDate;
        
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value){
              //   titleInput=value;
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => _submitData(),
              //  onChanged: (value){
              //   titleInput=value;
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(child: Text(selectedDate==null? 'No Date Choosen !': 'Picked Date:${DateFormat.yMd().format(selectedDate)}')),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date'),
                    onPressed: _presentdatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: _submitData),
          ],
        ),
      ),
    );
  }
}
