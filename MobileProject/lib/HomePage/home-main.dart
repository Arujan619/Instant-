import 'package:flutter/material.dart';
import '../WalletPage/wallet-main.dart';
import '../MetricsPage/metrics-main.dart';
import '../ProfilePage/profile-main.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'recent-transaction.dart';



/*
    Description:
    - HomeMain is the main page for the application
    - Shows current balance
    - Shows performance overall (graph over time)
    - Shows current Date
    - Shows recent transactions
    - Shows bottom snackbar navigation (wallet, metrics, profile)

 */

/*
    TODO:
    - UI Layout
    - SnackBar Navigation (Wallet, Metrics, Profile)
    ...

 */

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/emback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppBar(
                title: const Text('Home Page', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
          body: const RecentTransactions(),
        ),
      ),
    );
  }
}