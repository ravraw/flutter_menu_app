import 'package:flutter/material.dart';

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
          children: const [
            Text(
              "item 1",
              style: TextStyle(backgroundColor: Colors.white),
            ),
            Text(
              "item 1",
              style: TextStyle(backgroundColor: Colors.white),
            ),
            Text(
              "item 1",
              style: TextStyle(backgroundColor: Colors.white),
            ),
            Text(
              "item 1",
              style: TextStyle(backgroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
