import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  const Result(this.resultScore, {Key? key}) : super(key: key);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likable!';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
