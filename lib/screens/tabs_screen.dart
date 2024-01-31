import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/meal.dart';
import 'package:flutter_menu_app/screens/categories_screen.dart';
import 'package:flutter_menu_app/screens/meals_screen.dart';
import 'package:flutter_menu_app/widgets/filters_screen.dart';
import 'package:flutter_menu_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Meal> favorites = [];

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

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    } else if (identifier == "Favorites") {
      setState(() {
        _selectedPageIndex = 1;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleFavorite: _toggleFavorite,
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
