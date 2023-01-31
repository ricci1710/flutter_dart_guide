import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function transactionHandler;

  const NewTransaction(this.transactionHandler, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate =DateTime(2018);
  final DateTime _invalidatedDate = DateTime(2018);

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty || _selectedDate.year <=  _invalidatedDate.year) {
      return;
    }

    if (double.parse(enteredAmount) <= 0) {
      return;
    }

    widget.transactionHandler(
      enteredTitle,
      double.parse(enteredAmount),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate.year <=  _invalidatedDate.year ? 'No Date' :
                     'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                    ),
                    onPressed: _presentDatePicker,
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Theme.of(context).textTheme.labelSmall?.color),
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
              ),
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
