import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/meal.dart';
import 'package:flutter_menu_app/widgets/ingredients_list.dart';
import 'package:flutter_menu_app/widgets/steps_list.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(
      {required this.meal, required this.onFavoritePressed, super.key});

  final Meal meal;
  final void Function(Meal meal) onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Details'), actions: [
        IconButton(
          onPressed: () => onFavoritePressed(meal),
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
