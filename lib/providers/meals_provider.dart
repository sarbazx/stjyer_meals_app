import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data.dart';
import '../models/meal.dart';

final favoriteMealsProvider = Provider<List<Meal>>(
  (ref) => dummyMeals,
);
