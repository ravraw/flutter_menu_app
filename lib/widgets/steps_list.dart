import 'package:flutter/material.dart';

class StepsList extends StatelessWidget {
  const StepsList({required this.steps, super.key});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Steps",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        const SizedBox(height: 10),
        ...steps.asMap().entries.map((step) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${step.key + 1}'),
            ),
            title: Text(
              step.value,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
          );
        }).toList(),
      ],
    );
  }
}
