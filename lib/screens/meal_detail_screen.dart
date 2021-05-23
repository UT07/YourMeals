import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final String mealId = routeArgs['id'];
    final Color appBarColor = routeArgs['color'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    final PreferredSizeWidget appBar = AppBar(
      title: Text(selectedMeal.title),
      backgroundColor: appBarColor,
    );
    Widget buildSectionTitle(String text) {
      return Container(
        margin: EdgeInsets.symmetric(
            vertical: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.01),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle('Ingredients'),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.23,
            width: double.infinity,
            child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: appBarColor,
                child: Text(
                  selectedMeal.ingredients[index],
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ),
          buildSectionTitle('Steps'),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.40,
            width: double.infinity,
            child: ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '#${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: appBarColor,
                    ),
                    // color: appBarColor,
                    title: Card(
                      color: appBarColor,
                      child: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Divider()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
