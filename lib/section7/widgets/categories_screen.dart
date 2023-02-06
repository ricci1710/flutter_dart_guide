import 'package:flutter/material.dart';

import './category_item.dart';
import '../mock/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisExtent: 20,
      ),
      children: dummyCategories
          .map((catData) => CategoryItem(
                catData.title,
                catData.color,
              ))
          .toList(),
    );
  }
}
