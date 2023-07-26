import 'package:flutter/material.dart';

import '../components/meals_list.dart';
import '../data/data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.category,
    required this.favoriteMeals,
    required this.toggleFavorite,
  });

  final Category category;
  final List<Meal> favoriteMeals;
  final Function(Meal) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: MealsList(
        meals: filteredMeals,
        favoriteMeals: favoriteMeals,
        toggleFavorite: toggleFavorite,
      ),
    );
  }
}
