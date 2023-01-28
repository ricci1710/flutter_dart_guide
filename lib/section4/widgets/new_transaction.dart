import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function transactionHandler;

  NewTransaction(this.transactionHandler, {Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty) {
      return;
    }

    if (double.parse(enteredAmount) <= 0) {
      return;
    }

    transactionHandler(
      titleController.text,
      double.parse(amountController.text),
    );
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
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
