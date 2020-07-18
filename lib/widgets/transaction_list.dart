import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleyetx;
  TransactionList(this.transaction,this.deleyetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text("No transaction!!"),
                Container(
                    height: 300,
                    child: Image.asset(
                      'assets/images/emptycart.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return 
                                 Container(
                                   child: Dismissible(
                                                                        child: Card(
                            
                  margin: EdgeInsets.symmetric(vertical:8,horizontal:5),
                  elevation: 5,
                                                                                                                                                child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('Rs.${transaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(transaction[index].title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: ()=> deleyetx(transaction[index].id),
                    ),
                    
                  ),
                                                                        ),
                  key: Key('${transaction[index]}'),
                  onDismissed: (direction){
                  deleyetx(transaction[index].id);
                  Scaffold.of(context).showSnackBar(SnackBar(content:Text('${transaction[index]}'+'is removed')));
                  },
                    background: Container(color: Colors.red,),

                                
                ),
                                 );
                
              },
              itemCount: transaction.length,
            ),
    );
  }
}
