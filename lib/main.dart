import 'package:flutter/material.dart';
import 'pages/dashboard.dart';
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
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
