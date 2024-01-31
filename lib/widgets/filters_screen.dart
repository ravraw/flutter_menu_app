import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FilterScreen> createState() {
    return State<FiltersScreen>();
  }
}

class_FiltersScreenState extends State<FiltersScreen> {

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
  body: const Column(children: [
    SwitchListTile(value: true, onChanged:(){}, title:  Text('Gluten-free'),subtitle: Text('Only includes gluten-free meals',)),
    SwitchListTile(value: false, onChanged:(){}, title:  Text('Lactose-free'),subtitle: Text('Only includes lactose-free meals',)),
    SwitchListTile(value: false, onChanged:(){}, title:  Text('_vegetarian'),subtitle: Text('Only includes lactose-free meals',)),
    SwitchListTile(value: false, onChanged:(){}, title:  Text('_vegan'),subtitle: Text('Only includes lactose-free meals',)),
  ],)
);
 }
}
