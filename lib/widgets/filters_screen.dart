import 'package:flutter/material.dart';
import 'package:flutter_menu_app/widgets/main_drawer.dart';

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
        drawer: MainDrawer(onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == "Categories") {
            Navigator.of(context).pushReplacementNamed('/');
          } else if (identifier == "Favorites") {
            Navigator.of(context).pushReplacementNamed('/favorites');
          } else if (identifier == "Filters") {
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pushReplacementNamed('/');
          }
        }),
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
              title: const Text('Vegetarian'),
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
              title: const Text('Vegan'),
              subtitle: const Text(
                'Only includes lactose-free meals',
              ),
            ),
          ],
        ));
  }
}
