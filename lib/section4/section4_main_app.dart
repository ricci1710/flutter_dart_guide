import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

class Section4MainApp extends StatelessWidget {
  const Section4MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: Section4HomePage(),
    );
  }
}

class Section4HomePage extends StatelessWidget {
  const Section4HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('CHART!'),
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
