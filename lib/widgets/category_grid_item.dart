import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: category.color,
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.7),
            category.color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
