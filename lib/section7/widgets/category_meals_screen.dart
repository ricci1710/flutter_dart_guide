import 'package:flutter/material.dart';

import '../mock/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final categoryMeals = dummyMeals.where((meal) => meal.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
