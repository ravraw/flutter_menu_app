import 'package:flutter/material.dart';
import 'package:flutter_menu_app/data/dummy_data.dart';
import 'package:flutter_menu_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
              CategoryGridItem(category: category)
          ],
        ),
      ),
    );
  }
}
