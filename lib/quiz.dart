import 'package:flutter/material.dart';
import 'package:flutter_dart_guide/answer.dart';
import 'package:flutter_dart_guide/question.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final VoidCallback answerQuestion;
  final List<Map<String, Object>> questions;

  const Quiz({
    super.key,
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList(),
      ],
    );
  }
}
