import 'package:flutter/material.dart';

class FlutterAssignmentText extends StatelessWidget {
  final String _displayText;

  const FlutterAssignmentText(this._displayText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_displayText),
    );
  }
}
