import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/meal.dart';
import 'package:flutter_menu_app/providers/favorites_provider.dart';
import 'package:flutter_menu_app/widgets/ingredients_list.dart';
import 'package:flutter_menu_app/widgets/steps_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Details'), actions: [
        IconButton(
          onPressed: () {
            bool wasAdded =
                ref.read(favoritesProvider.notifier).toggleFavorite(meal);
            SnackBar(
              content: Text(
                  wasAdded ? 'Added to favorites' : 'Removed from favorites'),
              duration: const Duration(seconds: 1),
            );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.favorite_border),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              meal.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 20),
            IngredientList(ingredients: meal.ingredients),
            const SizedBox(height: 20),
            StepsList(steps: meal.steps),
          ],
        ),
      ),
    );
  }
}
