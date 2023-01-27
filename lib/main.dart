import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void answerQuestion(int value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: Column(
          children: [
            const Text('The question!'),
            ElevatedButton(
              onPressed: () => answerQuestion(1),
              child: const Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: () => answerQuestion(2),
              child: const Text('Answer 2'),
            ),
            ElevatedButton(
              onPressed: () => answerQuestion(3),
              child: const Text('Answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
