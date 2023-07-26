import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMeals extends StateNotifier<List<Meal>> {
  FavoriteMeals() : super([]);

  void toggleFavoriteMeal(Meal meal) {
    if (state.contains(meal)) {
      List<Meal> removedMeals = [];
      for (var element in state) {
        if (element != meal) {
          removedMeals.add(element);
        }
      }
      state = removedMeals;
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteMeals, List<Meal>>(
  (ref) => FavoriteMeals(),
);
