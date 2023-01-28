import 'package:flutter/material.dart';
import 'package:flutter_dart_guide/section2/exercise/flutter_assignment_text.dart';
import 'package:flutter_dart_guide/section2/exercise/flutter_assignment_text_control.dart';

class FlutterAssignmentApp extends StatefulWidget {
  const FlutterAssignmentApp({Key? key}) : super(key: key);

  @override
  State<FlutterAssignmentApp> createState() => _FlutterAssignmentAppState();
}

class _FlutterAssignmentAppState extends State<FlutterAssignmentApp> {
  var _counter = 0;
  String _displayText = 'Some changeable Text!';

  final _textPhrases = [
    'Exercise Flutter Assignment Text 1',
    'Text 1 Exercise Flutter Assignment',
    'Exercise Flutter Text 1 Assignment',
  ];

  void _changeText() {
    _counter += 1;
    var rest = _counter % 3;

    setState(() {
      _displayText = _textPhrases[rest];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise Flutter Assignment'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            FlutterAssignmentText(_displayText),
            FlutterAssignmentTextControl(_changeText),
          ],
        ),
      ),
    );
  }
}
