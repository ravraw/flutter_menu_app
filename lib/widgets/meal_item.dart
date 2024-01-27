import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/meal.dart';
import 'package:flutter_menu_app/screens/meal_details_screen.dart';
import 'package:flutter_menu_app/widgets/meal_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key});

  final Meal meal;

  String _capitalizeText(String text) {
    return text.characters.first.toUpperCase() +
        text.substring(1).toLowerCase();
  }

  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () => onSelectMeal(context, meal),
        child: Column(
          children: [
            Stack(children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    meal.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MealTrait(
                    icon: Icons.schedule,
                    lable: '${meal.duration} min',
                    color: Colors.black),
                const SizedBox(width: 6),
                MealTrait(
                    icon: Icons.work,
                    lable: _capitalizeText(meal.complexity.name),
                    color: Colors.black),
                const SizedBox(width: 6),
                MealTrait(
                    icon: Icons.attach_money,
                    lable: _capitalizeText(meal.affordability.name),
                    color: Colors.black),
                // MealTrait
              ],
            ),
          ],
        ),
      ),
    );
  }
}
