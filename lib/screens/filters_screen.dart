import 'package:flutter/material.dart';
import 'package:flutter_menu_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({required this.currentFilters, super.key});

  final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarian = widget.currentFilters[Filter.vegetarian]!;
    _vegan = widget.currentFilters[Filter.vegan]!;
  }

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
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFree,
              Filter.lactoseFree: _lactoseFree,
              Filter.vegetarian: _vegetarian,
              Filter.vegan: _vegan,
            });
          },
          child: Column(
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
          ),
        ));
  }
}
