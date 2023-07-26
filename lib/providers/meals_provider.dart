import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data.dart';
import '../models/meal.dart';

final mealsProvider = Provider<List<Meal>>(
  (ref) => dummyMeals,
);
