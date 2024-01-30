import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  // Widget _buildListTile(String title, IconData icon, Function() onTap) {
  //   return ListTile(
  //     leading: Icon(icon, size: 26),
  //     title: Text(
  //       title,
  //       style: const TextStyle(
  //         fontFamily: 'RobotoCondensed',
  //         fontSize: 24,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     onTap: onTap,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text(
              'Flutter Reciepes',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Categories'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/favorites');
            },
          ),
        ],
      ),
    );
  }
}
