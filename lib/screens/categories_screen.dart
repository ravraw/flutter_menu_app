import 'package:flutter/material.dart';
import 'package:flutter_menu_app/data/dummy_data.dart';
import 'package:flutter_menu_app/models/category.dart';
import 'package:flutter_menu_app/models/meal.dart';
import 'package:flutter_menu_app/screens/meals_screen.dart';
import 'package:flutter_menu_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.filteredMeals, super.key});

  final List<Meal> filteredMeals;

  void _selectCategory(BuildContext context, Category category) {
    List<Meal> categoryMeals = filteredMeals
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(category.title, categoryMeals),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onTap: () => _selectCategory(
                        context,
                        category,
                      ))
          ],
        ),
      ),
    );
  }
}
