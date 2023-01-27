import 'package:flutter/material.dart';
import 'package:flutter_dart_guide/answer.dart';

import './question.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Red', 'Yellow', 'Green', 'Blue'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Bird', 'Lion', 'Snake'],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    },
  ];

  void _answerQuestion() {

    setState(() => _questionIndex += 1);
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    }
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
        body: _questionIndex < questions.length
        ? Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        )
        : const Center(
          child: Text('You did it!'),
        ),
      ),
    );
  }
}
