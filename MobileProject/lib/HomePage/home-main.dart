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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/emback.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Home',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Instant+',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: RecentTransactions(),
        ),
      ),
    );
  }
}