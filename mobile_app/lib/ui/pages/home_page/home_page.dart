import 'package:flutter/material.dart';

import '../../widget/dashboard_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy data for demonstration
  int customerCount = 100;
  int itemCount = 500;
  int orderCount = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DashboardCard(title: 'Customers', count: customerCount),
            DashboardCard(title: 'Items', count: itemCount),
            DashboardCard(title: 'Orders', count: orderCount),
          ],
        ),
      ),
    );
  }
}
