import 'package:flutter/material.dart';
import 'package:your_meals/dummy_data.dart';
import 'package:your_meals/screens/filters_screen.dart';
import 'package:your_meals/screens/meal_detail_screen.dart';
import 'package:your_meals/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/meals_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
    'halal': false,
    'kosher': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  bool _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['halal'] && !meal.isHalal) {
          return false;
        }
        if (_filters['kosher'] && !meal.isKosher) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
        TabScreen.routeName: (ctx) => TabScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        MealsScreen.routeName: (ctx) => MealsScreen(_availableMeals),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters),
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
