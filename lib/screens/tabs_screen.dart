import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/meal.dart';
import 'package:flutter_menu_app/providers/meal_provider.dart';
import 'package:flutter_menu_app/screens/categories_screen.dart';
import 'package:flutter_menu_app/screens/meals_screen.dart';
import 'package:flutter_menu_app/screens/filters_screen.dart';
import 'package:flutter_menu_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Meal> favorites = [];
  Map<Filter, bool> _currentFilters = kInitialFilters;

  void _selectpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      if (favorites.contains(meal)) {
        favorites.remove(meal);
        _showInfoMessage('Removed "${meal.title}" from favorites');
      } else {
        favorites.add(meal);
        _showInfoMessage('Added "${meal.title}" to favorites.');
      }
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (ctx) => FiltersScreen(currentFilters: _currentFilters),
      ));

      setState(() {
        _currentFilters = result ?? kInitialFilters;
      });
    } else if (identifier == "Favorites") {
      // Navigator.of(context).pop();
      setState(() {
        _selectedPageIndex = 1;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(mealsProvider);
    List<Meal> filteredMeals = provider.where((meal) {
      if (_currentFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_currentFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_currentFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_currentFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      toggleFavorite: _toggleFavorite,
      filteredMeals: filteredMeals,
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        "Favorites",
        favorites,
        _toggleFavorite,
      );
      activePageTitle = "Favorites";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            activePageTitle,
          ),
        ),
        drawer: MainDrawer(onSelectScreen: _setScreen),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _selectpage(index),
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ],
        ));
  }
}
