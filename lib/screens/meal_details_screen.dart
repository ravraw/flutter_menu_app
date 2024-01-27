import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
      ),
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
            const SizedBox(height: 10),
            ...meal.ingredients.map((ingredient) => Text(ingredient)).toList(),
            const SizedBox(height: 20),
            ...meal.steps.asMap().entries.map((step) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${step.key + 1}'),
                ),
                title: Text(step.value),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
