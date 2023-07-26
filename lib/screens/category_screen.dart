import 'package:flutter/material.dart';
import 'package:stajyer_meals_app/data/data.dart';
import 'package:stajyer_meals_app/models/category.dart';
import 'package:stajyer_meals_app/screens/meal_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final Category category;

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
      body: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MealScreen(
                    meal: filteredMeals[index],
                  );
                },
              ),
            );
          },
          child: Card(
            child: Image.network(filteredMeals[index].imageUrl),
          ),
        ),
      ),
    );
  }
}
