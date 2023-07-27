import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
import '../providers/favorites_provider.dart';

class MealScreen extends ConsumerStatefulWidget {
  const MealScreen({super.key, required this.meal});
  final Meal meal;

  @override
  ConsumerState<MealScreen> createState() => MealScreenState();
}

class MealScreenState extends ConsumerState<MealScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteProvider);
    final isFavorite = favorites.contains(widget.meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () => ref
                .read(favoriteProvider.notifier)
                .toggleFavoriteMeal(widget.meal),
            iconSize: 36,
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: Hero(
        tag: widget.meal.id,
        child: Center(
          child: RotationTransition(
            turns: _animationController,
            child: Image.network(widget.meal.imageUrl),
          ),
        ),
      ),
    );
  }
}
