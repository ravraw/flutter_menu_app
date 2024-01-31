import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: _glutenFree,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFree = isChecked;
                });
              },
              title: const Text('Gluten-free'),
              subtitle: const Text('Only includes gluten-free meals'),
            ),
            SwitchListTile(
              value: _lactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFree = isChecked;
                });
              },
              title: const Text('Lactose-free'),
              subtitle: const Text(
                'Only includes lactose-free meals',
              ),
            ),
            SwitchListTile(
              value: _vegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarian = isChecked;
                });
              },
              title: const Text('_vegetarian'),
              subtitle: const Text(
                'Only includes lactose-free meals',
              ),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (isChecked) {
                setState(() {
                  _vegan = isChecked;
                });
              },
              title: const Text('_vegan'),
              subtitle: const Text(
                'Only includes lactose-free meals',
              ),
            ),
          ],
        ));
  }
}
