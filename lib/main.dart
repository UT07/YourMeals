import 'package:flutter/material.dart';
import 'package:your_meals/categories_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: CategoriesScreen(),
    );
  }
}
