import 'package:flutter/material.dart';
import 'package:flutter_dart_guide/section4/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: transactions
              .map((tx) => Card(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '${tx.amount} €',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
