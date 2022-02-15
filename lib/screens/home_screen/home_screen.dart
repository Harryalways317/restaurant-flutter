import 'package:flutter/material.dart';

class Restuarant extends StatefulWidget {
  const Restuarant({Key? key}) : super(key: key);

  @override
  _RestuarantState createState() => _RestuarantState();
}

class _RestuarantState extends State<Restuarant> {
  int _currentIndex = 0;
  final tabs = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Cart'),
    ),
    Center(
      child: Text('Profile'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: tabs[_currentIndex],
      ),
    );
  }
}
