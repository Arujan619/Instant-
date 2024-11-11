import 'package:flutter/material.dart';
import '../WalletPage/wallet-main.dart';
import '../MetricsPage/metrics-main.dart';
import '../ProfilePage/profile-main.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}