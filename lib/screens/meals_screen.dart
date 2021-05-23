import 'package:flutter/material.dart';
import 'package:your_meals/widgets/meal_item.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // MealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as CategoryItem;
    final categoryTitle = routeArgs.title;
    final categoryId = routeArgs.id;
    final categoryColor = routeArgs.color;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              id: categoryMeals[index].id,
              color: categoryColor,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
