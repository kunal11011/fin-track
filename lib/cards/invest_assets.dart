import 'package:flutter/material.dart';

import 'asset_card.dart';

class InvestmentAssets extends StatelessWidget {
  final List assets = [
    {
      "title": "ABF Indonesia Bond I...",
      "subtitle": 'PT Bahana TCW Investment Manag...',
      "amount": 2.58,
      "change": 10,
      "isPositive": true,
      "icon": Icon(Icons.abc)
    },
    {
      "title": "BNI-AM Indeks IDX30",
      "subtitle": 'PT BNI Asset Management',
      "amount": 1.64,
      "change": 4.59,
      "isPositive": false,
      "icon": Icon(Icons.abc)
    },
    {
      "title": "Majoris Sukuk Negar...",
      "subtitle": 'PT.Majoris Asset Management',
      "amount": 2.58,
      "change": 10,
      "isPositive": false,
      "icon": Icon(Icons.abc)
    },
    {
      "title": "Eastspring Syariah Fi...",
      "subtitle": 'PT Eastspring Investments Indonesia',
      "amount": 93,
      "isPositive": true,
      "change": 20,
      "icon": Icon(Icons.abc)
    }
  ];

  InvestmentAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  // width: 300,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      'My Investment Assets',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      'Explore investment asset and keep up to date',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                Row(
                  spacing: 8.0,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text('Filters'),
                      icon: Icon(Icons.tune),
                      style: Theme.of(context).elevatedButtonTheme.style,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: Text('See All'),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: assets.map((asset) {
                    int index = assets.indexOf(asset);
                    return AssetCard(asset: asset);
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
