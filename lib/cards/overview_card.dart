import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key, required this.investment});

  final dynamic investment;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 30,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  investment['title'],
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Icon(
                  investment['iconName'],
                  size: 32,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${investment['amount']}',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
                ),
                Row(
                  spacing: 2.0,
                  children: [
                    Text(
                      '${investment['changePercent']}%',
                      style: TextStyle(
                        color: investment['isPositive']
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                    ),
                    investment['isPositive']
                        ? Icon(
                            Icons.trending_up_rounded,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.trending_down_rounded,
                            color: Colors.redAccent,
                          ),
                    Text(
                      '\$${investment['changeAmount']} today',
                      style: TextStyle(
                        color: investment['isPositive']
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
