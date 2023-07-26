import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_screen.dart';

class MealsList extends StatelessWidget {
  const MealsList({
    super.key,
    required this.meals,
    required this.favoriteMeals,
    required this.toggleFavorite,
  });

  final List<Meal> meals;
  final List<Meal> favoriteMeals;
  final Function(Meal) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MealScreen(
                  meal: meals[index],
                  favoriteMeals: favoriteMeals,
                  toggleFavorite: toggleFavorite,
                );
              },
            ),
          );
        },
        child: Card(
          child: Image.network(meals[index].imageUrl),
        ),
      ),
    );
  }
}
