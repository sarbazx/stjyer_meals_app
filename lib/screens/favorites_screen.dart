import 'package:flutter/material.dart';

import '../components/meals_list.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.favoritesMeal,
    required this.toggleFavorite,
  });

  final List<Meal> favoritesMeal;
  final Function(Meal) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return MealsList(
      meals: favoritesMeal,
      favoriteMeals: favoritesMeal,
      toggleFavorite: toggleFavorite,
    );
  }
}
