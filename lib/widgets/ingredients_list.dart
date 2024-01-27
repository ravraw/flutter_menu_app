import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({required this.ingredients, super.key});

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Ingredients",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        const SizedBox(height: 10),
        ...ingredients
            .map((ingredient) => Text(
                  ingredient,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ))
            .toList(),
      ],
    );
  }
}
