import 'package:flutter/material.dart';

import 'saving_card.dart';

class SavingsPlan extends StatelessWidget {
  final List savingsPlan = [
    {
      "title": "Retirement Plan",
      "time": 2045,
      "amount": 89327,
      "progress": 63,
      "icon": Icon(Icons.money)
    },
    {
      "title": "Car Plan",
      "time": 2029,
      "amount": 4111,
      "progress": 80,
      "icon": Icon(Icons.money)
    },
    {
      "title": "Home Plan",
      "time": 2035,
      "amount": 23423,
      "progress": 20,
      "icon": Icon(Icons.money)
    },
  ];

  SavingsPlan({super.key});
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              // width: 300,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'My Savings Plan',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  'Saving plan based on your needs',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                trailing: Icon(Icons.more_vert_outlined),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: savingsPlan.map((plan) {
                    int index = savingsPlan.indexOf(plan);
                    return SavingCard(plan: plan);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
