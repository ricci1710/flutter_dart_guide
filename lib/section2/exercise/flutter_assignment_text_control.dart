import 'package:flutter/material.dart';

class FlutterAssignmentTextControl extends StatelessWidget {
  final VoidCallback _changeTextHandler;

  const FlutterAssignmentTextControl(this._changeTextHandler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: ElevatedButton(
        onPressed: _changeTextHandler,
        child: const Text('Change'),
      ),
    );
  }
}
