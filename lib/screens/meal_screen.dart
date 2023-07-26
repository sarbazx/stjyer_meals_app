import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.meal,
    required this.favoriteMeals,
    required this.toggleFavorite,
  });

  final Meal meal;
  final List<Meal> favoriteMeals;
  final Function(Meal) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => toggleFavorite(meal),
            iconSize: 36,
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: Center(
        child: Image.network(meal.imageUrl),
      ),
    );
  }
}
