import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categoryTitle'),
      ),
      body: const Center(
        child: Text(
          'The Recipes For The Category!',
        ),
      ),
    );
  }
}
