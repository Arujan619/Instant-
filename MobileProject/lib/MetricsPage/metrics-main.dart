import 'package:flutter/material.dart';
import '../HomePage/home-main.dart';
import '../WalletPage/wallet-main.dart';
import '../ProfilePage/profile-main.dart';

/*
    Description:
    - MetricsMain is the main page for the metrics page
    - Shows user earnings with graph
    - Shows vaults accounts with graph
    - Shows earnings increase/decrease percentage

 */

/*
    TODO:
    - UI Layout
    - SnackBar Navigation (Wallet, Metrics, Profile)
    ...

 */

class MetricsMain extends StatelessWidget {
  const MetricsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Metrics Page'),
      ),
    );
  }
}