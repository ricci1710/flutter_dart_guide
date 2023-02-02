import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dart_guide/section4/section4_main_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const Section4MainApp());
}
