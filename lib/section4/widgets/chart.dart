import 'package:flutter/material.dart';
import 'package:flutter_dart_guide/section4/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      // for (var i = 0; i < recentTransactions.length; i += 1) {
      //   var date = recentTransactions[i].date;
      //   if (date.day == weekDay.day && date.month == weekDay.month && date.year == weekDay.year) {
      //     totalSum += recentTransactions[i].amount;
      //   }
      // }

      for (var transaction in recentTransactions) {
        var date = transaction.date;
        if (date.day == weekDay.day && date.month == weekDay.month && date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      print(DateFormat.E(weekDay));
      print(totalSum);

      return {'day': DateFormat.E(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: const [],
      ),
    );
  }
}
