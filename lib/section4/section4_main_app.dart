import 'package:flutter/material.dart';

import './transaction.dart';

class Section4MainApp extends StatelessWidget {
  const Section4MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: Section4HomePage(),
    );
  }
}

class Section4HomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(id: 'id1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 'id2', title: 'Weekly Groceries', amount: 16.53, date: DateTime.now()),
  ];

  Section4HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('CHART!'),
            ),
          ),
          const Card(
            color: Colors.red,
            child: Text('LIST OF TX'),
          ),
        ],
      ),
    );
  }
}
