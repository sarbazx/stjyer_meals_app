import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorites_provider.dart';

import '../components/meals_list.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteProvider);
    return MealsList(
      meals: favoriteMeals,
    );
  }
}
