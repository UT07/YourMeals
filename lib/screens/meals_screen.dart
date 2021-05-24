import 'package:flutter/material.dart';
import 'package:your_meals/models/meal.dart';
import 'package:your_meals/widgets/meal_item.dart';
import '../widgets/category_item.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  MealsScreen(this.availableMeals);
  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  Color categoryColor;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final routeArgs = ModalRoute.of(context).settings.arguments as CategoryItem;
    categoryTitle = routeArgs.title;
    final categoryId = routeArgs.id;
    categoryColor = routeArgs.color;
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              id: displayedMeals[index].id,
              color: categoryColor,
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
