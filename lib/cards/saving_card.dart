import 'package:flutter/material.dart';

class SavingCard extends StatelessWidget {
  const SavingCard({
    super.key,
    required this.plan,
  });

  final dynamic plan;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            SizedBox(
              // width: 300,
              // height: 50,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: plan['icon'],
                title: Text(
                  plan['title'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Finished in ${plan['time']}',
                  style: TextStyle(fontSize: 10),
                ),
                trailing: Text(
                  '\$${plan['amount']}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              // width: 300,
              child: Column(
                spacing: 4.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progress',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        '${plan['progress']}%',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    // width: 300,
                    child: LinearProgressIndicator(
                      value: plan['progress'] / 100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
