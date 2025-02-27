import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

class InvestmentStatistics extends StatelessWidget {
  const InvestmentStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Investment Statistics',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Revealing risk, and growth in investments.',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                NavBar(),
              ],
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text('CHARTS'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
