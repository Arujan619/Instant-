import 'package:flutter/material.dart';
import '../HomePage/home-main.dart';
import '../WalletPage/wallet-main.dart';
import '../MetricsPage/metrics-main.dart';
import '../ProfilePage/profile-main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeMain(),
    WalletMain(),
    MetricsMain(),
    ProfileMain(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.home, color: Colors.white),
            ),
            label: '',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.account_balance_wallet, color: Colors.white),
            ),
            label: '',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.show_chart, color: Colors.white),
            ),
            label: '',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.settings, color: Colors.white),
            ),
            label: '',
            backgroundColor: Colors.deepPurple,
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.purple[800], //this changes the color of the selected item's label
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
      ),
    );

  }
}