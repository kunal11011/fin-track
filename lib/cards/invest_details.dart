import 'package:flutter/material.dart';

class InvestmentDetails extends StatelessWidget {
  const InvestmentDetails({super.key, required this.allAssets});
  final Map<String, dynamic> allAssets;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8.0,
          children: [
            SizedBox(
              // width: 300,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Investment Details',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  'Assets you have in your account',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                trailing: Icon(Icons.more_vert_outlined),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${allAssets['amount']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${allAssets['changePercent']}%',
                      style: TextStyle(
                        color: allAssets['isPositive']
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                    ),
                    allAssets['isPositive']
                        ? Icon(
                            Icons.trending_up_rounded,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.trending_down_rounded,
                            color: Colors.redAccent,
                          ),
                    Text(
                      'This Month',
                      style: TextStyle(
                        color: allAssets['isPositive']
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              // height: 250,
              // width: 300,
              child: ListView.builder(
                itemCount: allAssets['assets'].length,
                itemBuilder: (context, index) {
                  final assets = allAssets['assets'];
                  final asset = assets[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      asset['name'],
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(
                      Icons.circle,
                      color: asset['color'],
                    ),
                    trailing: Row(
                      spacing: 8,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${asset['amount']}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Chip(
                          label: Text(
                            '${asset['share']} % ',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: asset['color'],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
