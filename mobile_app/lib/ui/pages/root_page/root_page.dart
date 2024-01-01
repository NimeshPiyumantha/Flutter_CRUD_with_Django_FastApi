import 'package:flutter/material.dart';
import 'package:mobile_app/ui/pages/customer_page/customer_page.dart';
import 'package:mobile_app/ui/pages/home_page/home_page.dart';

class PosApp extends StatefulWidget {
  const PosApp({
    super.key,
    currentIndex,
  });

  @override
  State<PosApp> createState() => _PosAppState();
}

class _PosAppState extends State<PosApp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile POS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Customers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        body: selectedIndex == 0
            ? const HomePage()
            : selectedIndex == 1
                ? const CustomerPage() // Replace `Container()` with the desired widget for the `selectedIndex == 1` case.
                : null,
      ),
    );
  }
}
