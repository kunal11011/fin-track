import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  final List<String> navItems = [
    'All Mutual Fund',
    'Stock',
    'Money Market',
    'Bonds',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 8,
        children: navItems.map((item) {
          int index = navItems.indexOf(item);
          return TextButton(
            onPressed: () {
              setState(() {
                selectedIndex = index;
                print('Clicked on: $item');
              });
            },
            style: TextButton.styleFrom(
              foregroundColor:
                  selectedIndex == index ? Colors.black : Colors.grey,
              textStyle: const TextStyle(fontSize: 16),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
