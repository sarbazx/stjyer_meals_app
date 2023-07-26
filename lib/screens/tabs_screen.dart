import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/meal.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  final List<Meal> _favoritesMeal = [dummyMeals[0]];

  void _toggleFavoriteMeal(Meal meal) {
    setState(() {
      if (_favoritesMeal.contains(meal)) {
        _favoritesMeal.remove(meal);
      } else {
        _favoritesMeal.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemekler"),
      ),
      body: _selectedIndex == 0
          ? CategoriesScreen(
              favoriteMeals: _favoritesMeal,
              toggleFavorite: _toggleFavoriteMeal,
            )
          : FavoritesScreen(
              favoritesMeal: _favoritesMeal,
              toggleFavorite: _toggleFavoriteMeal,
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
