import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function transactionHandler;

  NewTransaction(this.transactionHandler, {Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                transactionHandler(titleController.text, double.parse(amountController.text));
              },
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.purple),
              ),
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
