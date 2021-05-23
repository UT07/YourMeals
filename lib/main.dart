import 'package:flutter/material.dart';
import 'package:your_meals/screens/meal_detail_screen.dart';
import 'package:your_meals/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.yellow,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      home: TabScreen(),
      routes: {
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        MealsScreen.routeName: (ctx) => MealsScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      // onUnknownRoute: ,
    );
  }
}
