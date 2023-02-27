import 'package:flutter/material.dart';
import 'package:flutter_dart_guide/section7/widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;

  const FavoritesScreen(this.favoritedMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - starting adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritedMeals[index].id,
            title: favoritedMeals[index].title,
            imageUrl: favoritedMeals[index].imageUrl,
            affordability: favoritedMeals[index].affordability,
            complexity: favoritedMeals[index].complexity,
            duration: favoritedMeals[index].duration,
          );
        },
        itemCount: favoritedMeals.length,
      );
    }
  }
}
