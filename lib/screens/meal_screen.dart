import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stajyer_meals_app/providers/meals_provider.dart';

import '../models/meal.dart';

class MealScreen extends ConsumerWidget {
  const MealScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteMealsProvider);
    final isFavorite = favorites.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {},
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
