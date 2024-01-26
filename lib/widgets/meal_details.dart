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
        body: Image.network(meal.imageUrl));
  }
}
