import 'package:flutter/material.dart';

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
                  borderRadius: BorderRadius.circular(10.0),
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
