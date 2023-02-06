/// Cooking App
import 'package:flutter/material.dart';

import './widgets/categories_screen.dart';

class Section7MainApp extends StatelessWidget {
  const Section7MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CategoriesScreen(),
    );
  }
}
