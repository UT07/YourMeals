import 'package:flutter/material.dart';
import 'category_item.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YourMeals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (catData) =>
                  CategoryItem(catData.title, catData.color, catData.id),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}