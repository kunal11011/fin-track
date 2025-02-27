import 'package:flutter/material.dart';

class AssetCard extends StatelessWidget {
  const AssetCard({
    super.key,
    required this.asset,
  });

  final dynamic asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              SizedBox(
                // width: 300,
                height: 50,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: asset['icon'],
                  title: Text(
                    asset['title'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Finished in ${asset['subtitle']}',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        Text('Total AUM'),
                        Text(
                          '\$ ${asset['amount']}M',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        Text('CAGR 1Y'),
                        Row(
                          spacing: 4,
                          children: [
                            Text(
                              '${asset['change']}%',
                              style: TextStyle(
                                color: asset['isPositive']
                                    ? Colors.green
                                    : Colors.redAccent,
                              ),
                            ),
                            asset['isPositive']
                                ? Icon(
                                    Icons.trending_up_rounded,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.trending_down_rounded,
                                    color: Colors.redAccent,
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
