import 'package:flutter/material.dart';

import '../components/category_item.dart';
import '../data/data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import 'category_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.favoriteMeals,
    required this.toggleFavorite,
  });
  final List<Meal> favoriteMeals;
  final Function(Meal) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: availableCategories.length,
      itemBuilder: (context, index) {
        final Category category = availableCategories[index];
        return InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const CategoryScreen(),
            //   ),
            // );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(
                  category: category,
                  favoriteMeals: favoriteMeals,
                  toggleFavorite: toggleFavorite,
                ),
              ),
            );
          },
          child: CategoryItem(category: category),
        );
      },
    );
  }
}
