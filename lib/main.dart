import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/portfolio.dart';
import 'pages/savings.dart';
import 'pages/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme:
            GoogleFonts.notoSansAdlamTextTheme(Theme.of(context).textTheme)
                .copyWith(
          headlineMedium: const TextStyle(
            fontSize: 18.0,
            // fontWeight: FontWeight.bold,
          ),
          headlineSmall: const TextStyle(
            fontSize: 12.0,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Investment Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = DashboardPage();
        break;
      case 1:
        page = PortfolioPage();
        break;
      case 2:
        page = SavingsPage();
        break;
      case 3:
        page = SettingsPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRailTheme(
                data: NavigationRailThemeData(
                  // backgroundColor: Colors.grey.shade700,
                  selectedLabelTextStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
                  // selectedIconTheme: const IconThemeData(color: Colors.blue),
                  unselectedIconTheme: const IconThemeData(color: Colors.grey),
                  // indicatorColor: Colors.blue,
                ),
                child: NavigationRail(
                  extended: constraints.maxWidth >= 750,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.dashboard),
                      label: Text('Dashboard'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.cases_rounded),
                      label: Text('Portfolio'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.savings),
                      label: Text('Savings'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page),
            ),
          ],
        ),
      );
    });
  }
}

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

class DashBoardHeader extends StatelessWidget {
  const DashBoardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Instrument',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Row(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.message),
              ),
              Container(
                width: 200,
                padding:
                    EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 0),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade600, width: 2.0),
                  ),
                ),
                // child: Material(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Kunal',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Text(
                    'Plan Type',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  leading: Icon(Icons.person),
                ),
              ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

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

class InvestmentBreakdown extends StatelessWidget {
  const InvestmentBreakdown({super.key, required this.allAssets});
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
                    fontSize: 16.0,
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
                            style: TextStyle(fontSize: 8.0),
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
    },
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
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text('Filters'),
                      icon: Icon(Icons.tune),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('See All'))
                  ],
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              // crossAxisAlignment: WrapCrossAlignment.start,
              // alignment: WrapAlignment.spaceBetween,
              // crossAxisAlignment: WrapCrossAlignment.center,
              // runAlignment: WrapAlignment.spaceBetween,
              children: assets.map((asset) {
                int index = assets.indexOf(asset);
                return AssetCard(asset: asset);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

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
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'My Savings Plan',
                  style: TextStyle(fontSize: 12),
                ),
                subtitle: Text(
                  'Saving plan based on your needs',
                  style: TextStyle(fontSize: 8),
                ),
                trailing: Icon(Icons.more_vert_outlined),
              ),
            ),
            ...savingsPlan.map((plan) {
              int index = savingsPlan.indexOf(plan);
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
                            style: TextStyle(fontSize: 12),
                          ),
                          subtitle: Text(
                            'Finished in ${plan['time']}',
                            style: TextStyle(fontSize: 8),
                          ),
                          trailing: Text('\$${plan['amount']}'),
                        ),
                      ),
                      SizedBox(
                        // width: 300,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Progress'),
                                Text('${plan['progress']}%')
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
            }),
          ],
        ),
      ),
    );
  }
}

class AssetCard extends StatelessWidget {
  const AssetCard({
    super.key,
    required this.asset,
    // required this.amount,
    // required this.iconName,
    // required this.percentChange,
    // required this.amountChange
  });

  final dynamic asset;
  // final int amount;
  // final IconData iconName;
  // final double percentChange;
  // final int amountChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
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
                  contentPadding: EdgeInsets.all(0),
                  leading: asset['icon'],
                  title: Text(
                    asset['title'],
                    style: TextStyle(fontSize: 12),
                  ),
                  subtitle: Text(
                    'Finished in ${asset['subtitle']}',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      border: Border.all(
                        color: Colors.black,
                        // width: 2.0,
                        // style: BorderStyle
                        // .solid,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        Text('Total AUM'),
                        Text('\$ ${asset['amount']} M'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      border: Border.all(
                        color: Colors.black,
                        // width: 2.0,
                        // style: BorderStyle
                        // .solid,
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
                            Text('${asset['change']}%'),
                            asset['isPositive']
                                ? Icon(Icons.trending_up_rounded)
                                : Icon(Icons.trending_down_rounded),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
