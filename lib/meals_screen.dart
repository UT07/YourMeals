import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  MealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recepies'),
      ),
      body: Center(
        child: Text('Nigga sike!!'),
      ),
    );
  }
}
