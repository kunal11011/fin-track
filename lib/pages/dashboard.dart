import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List investments = [
    {
      'title': 'My Investment Asset',
      'amount': 489237,
      'iconName': Icons.attach_money,
      'changePercent': 1.23,
      'changeAmount': 4214,
      'isPositive': true
    },
    {
      'title': 'Yearly Profits',
      'amount': 153251,
      'iconName': Icons.attach_money,
      'changePercent': 1.23,
      'changeAmount': 1536,
      'isPositive': false
    },
    {
      'title': 'Profit Margin',
      'amount': 12332,
      'iconName': Icons.attach_money,
      'changePercent': 4.23,
      'changeAmount': 421,
      'isPositive': true
    }
  ];

  DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DashBoardHeader(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back Kunal Kothari',
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        'Happy to see you again, Get update of your asset today, good luck!!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('Download Report'),
                    icon: Icon(Icons.cloud_download_outlined),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: investments.map((investment) {
                return Flexible(
                  flex: 1,
                  child: OverviewCard(investment: investment),
                );
              }).toList(),
            ),
            SizedBox(
              height: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: InvestmentBreakdown(
                      allAssets: {
                        "amount": 104152,
                        "changePercent": 4.52,
                        "isPositive": true,
                        "assets": [
                          {
                            'name': 'Money Market',
                            'color': Colors.purple.shade200,
                            'amount': 43242,
                            'share': 43
                          },
                          {
                            'name': 'Stocks',
                            'color': Colors.cyan.shade200,
                            'amount': 32342,
                            'share': 32
                          },
                          {
                            'name': 'Bonds',
                            'color': Colors.orange.shade200,
                            'amount': 14234,
                            'share': 14
                          },
                          {
                            'name': 'Banks',
                            'color': Colors.greenAccent.shade200,
                            'amount': 5421,
                            'share': 4
                          },
                          {
                            'name': 'Crypto',
                            'color': Colors.pink.shade200,
                            'amount': 8913,
                            'share': 7
                          }
                        ],
                      },
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: InvestmentStatistics(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 460,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: InvestmentAssets(),
                  ),
                  Flexible(
                    flex: 2,
                    child: SavingsPlan(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
