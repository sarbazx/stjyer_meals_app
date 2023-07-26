import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/meals_list.dart';
import '../models/category.dart';
import '../providers/meals_provider.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = ref.watch(mealsProvider);
    final filteredMeals = meals
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
      ),
    );
  }
}
