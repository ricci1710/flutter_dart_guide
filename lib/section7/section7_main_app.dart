/// Cooking App
import 'package:flutter/material.dart';

class Section7MainApp extends StatelessWidget {
  const Section7MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Section7HomePage(),
    );
  }
}

class Section7HomePage extends StatefulWidget {
  const Section7HomePage({super.key});

  @override
  State<Section7HomePage> createState() => _Section7HomePageState();
}

class _Section7HomePageState extends State<Section7HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
