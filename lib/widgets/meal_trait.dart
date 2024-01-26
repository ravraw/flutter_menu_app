import 'package:flutter/material.dart';

class MealTrait extends StatelessWidget {
  const MealTrait(
      {required this.icon,
      required this.lable,
      required this.color,
      super.key});

  final IconData icon;
  final String lable;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: color),
        const SizedBox(width: 6),
        Text(
          lable,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
