import 'package:flutter/material.dart';
import 'package:stock_dashboard/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinTrack',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Investment Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
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
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
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

class GeneratorPage extends StatelessWidget {
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              children: [
                Flexible(
                  flex: 1,
                  child: OverviewCard(
                      title: 'Card title',
                      amount: 489237,
                      iconName: Icons.attach_money,
                      percentChange: 4.23,
                      amountChange: 123),
                ),
                Flexible(
                  flex: 1,
                  child: OverviewCard(
                      title: 'Card title',
                      amount: 489237,
                      iconName: Icons.attach_money,
                      percentChange: 4.23,
                      amountChange: 123),
                ),
                Flexible(
                  flex: 1,
                  child: OverviewCard(
                      title: 'Card title',
                      amount: 489237,
                      iconName: Icons.attach_money,
                      percentChange: 4.23,
                      amountChange: 123),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InvestmentBreakdown(
                  assets: [
                    {
                      'name': 'Money Market',
                      'color': 'purple',
                      'amount': 43242,
                      'share': 32
                    },
                    {
                      'name': 'Stocks',
                      'color': 'cyan',
                      'amount': 32342,
                      'share': 23
                    },
                    {
                      'name': 'Bonds',
                      'color': 'orange',
                      'amount': 14234,
                      'share': 16
                    },
                    {
                      'name': 'Banks',
                      'color': 'grey',
                      'amount': 5421,
                      'share': 35
                    },
                    {
                      'name': 'Crypto',
                      'color': 'pink',
                      'amount': 8913,
                      'share': 9
                    }
                  ],
                ),
                Expanded(
                  child: InvestmentStatistics(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: InvestmentAssets()),
                SavingsPlan(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DashBoardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Input Field"),
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
              SizedBox(
                width: 200,
                // child: Material(
                child: ListTile(
                  title: Text(
                    'Kunal',
                    style: TextStyle(fontSize: 12),
                  ),
                  subtitle: Text(
                    'Plan Type',
                    style: TextStyle(fontSize: 8),
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

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Portfolio Page"),
    );
  }
}

class SavingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Savings Page'),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings page'),
    );
  }
}

class OverviewCard extends StatelessWidget {
  const OverviewCard(
      {required this.title,
      required this.amount,
      required this.iconName,
      required this.percentChange,
      required this.amountChange});

  final String title;
  final int amount;
  final IconData iconName;
  final double percentChange;
  final int amountChange;

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
              children: [Text(title), Icon(iconName)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('\$$amount'), Text('Change')],
            ),
          ],
        ),
      ),
    );
  }
}

class InvestmentBreakdown extends StatelessWidget {
  const InvestmentBreakdown({required this.assets});
  final List<Map<String, dynamic>> assets;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Investment Details',
                  style: TextStyle(fontSize: 12),
                ),
                subtitle: Text(
                  'Assets you have in your account',
                  style: TextStyle(fontSize: 8),
                ),
                trailing: Icon(Icons.more_vert_outlined),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$83279'),
                Text('Change'),
              ],
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: ListView.builder(
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  final asset = assets[index];
                  return ListTile(
                    title: Text(asset['name']),
                    leading: Icon(Icons.circle),
                    trailing: Row(
                      spacing: 8,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('\$${asset['amount']}'),
                        Chip(label: Text('${asset['share']}%')),
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
                  children: [
                    Text(
                      'Investment Statistics',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Revealing risk, and growth in investments.',
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                NavBar(),
              ],
            ),
            Text('Navbar Chart'),
          ],
        ),
      ),
    );
  }
}

class InvestmentAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Investment Aasets'),
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
  ];
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
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
                      Text('Hello card'),
                     SizedBox(
                      width: 100,
                       child: LinearProgressIndicator(
                        value: 0.3,
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
