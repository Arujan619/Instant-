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
  static const Color _bottomNavBarColor = Color(0xFF040929);
  static const LinearGradient _avatarNavBarGradient = LinearGradient(
    colors: [Color(0xFF4457B1), Color(0xFFA91CB3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

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
      backgroundColor: Colors.transparent,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.4),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SizedBox(
              height: 80,
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: _avatarNavBarGradient,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.home, color: Colors.white),
                      ),
                    ),
                    label: '●',
                    backgroundColor: _bottomNavBarColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: _avatarNavBarGradient,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.account_balance_wallet, color: Colors.white),
                      ),
                    ),
                    label: '●',
                    backgroundColor: _bottomNavBarColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: _avatarNavBarGradient,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.show_chart, color: Colors.white),
                      ),
                    ),
                    label: '●',
                    backgroundColor: _bottomNavBarColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: _avatarNavBarGradient,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.settings, color: Colors.white),
                      ),
                    ),
                    label: '●',
                    backgroundColor: _bottomNavBarColor,
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                backgroundColor: Colors.transparent,
                selectedLabelStyle: TextStyle(fontSize: 10),
                unselectedLabelStyle: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}