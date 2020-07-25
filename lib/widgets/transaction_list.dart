import 'package:expenses/models/transaction.dart';
import 'package:expenses/widgets/transaction_item.dart';
import 'package:flutter/material.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleyetx;
  TransactionList(this.transaction, this.deleyetx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: transaction.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.10,
                  ),
                  Text(
                    "No Transaction !",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.10),
                  Container(
                    child: CircleAvatar(
                        radius: constraints.maxHeight * 0.3,
                        child: Icon(
                          Icons.money_off,
                          size: constraints.maxHeight * 0.5,
                        )),
                    // height: 300,
                    // child: Image.asset(
                    //   'assets/images/emptycart.png',
                    //   fit: BoxFit.cover,
                    // ))
                  )
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transaction: transaction[index], deleyetx: deleyetx);
              },
              itemCount: transaction.length,
            ),
    );
  }
}

