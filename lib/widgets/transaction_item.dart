import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleyetx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleyetx;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('₹${transaction.amount}'),
                ),
              ),
            ),
            title: Text(transaction.title,
                style: Theme.of(context).textTheme.headline6),
            subtitle: Text(
              DateFormat.yMMMd().format(transaction.date),
            ),
            trailing: MediaQuery.of(context).size.width > 460
                ? FlatButton.icon(
                    icon: Icon(Icons.delete),
                    label: Text('Delete'),
                    textColor: Theme.of(context).errorColor,
                    onPressed: () =>
                        deleyetx(transaction.id),
                  )
                : IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () =>
                        deleyetx(transaction.id),
                  ),
          ),
        ),
        key: Key('${transaction.id}'),
        onDismissed: (direction) {
          deleyetx(transaction.id);
          Scaffold.of(context).showSnackBar(SnackBar(
              content:
                  Text('${transaction.title} :' + 'is removed from the List')));
        },
        background: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
