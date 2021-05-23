import 'package:flutter/material.dart';
import 'package:your_meals/screens/categories_screen.dart';
import 'package:your_meals/screens/favorites_screen.dart';
import 'package:your_meals/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': ' Favorites'}
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
              // color: Colors.white,
            ),
            title: Text(
              'Categories',
              // style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
              // color: Colors.white,
            ),
            title: Text(
              'Favorites',
              // style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
