import 'package:flutter/material.dart';
import '../HomePage/home-main.dart';
import '../MetricsPage/metrics-main.dart';
import '../ProfilePage/profile-main.dart';

/*
    Description:
    - WalletMain is the main page for the wallet vault
    - Shows list of vaults
    - Allows to create new vault
    - Allows to delete vault
    - Allows to edit vault

 */

/*
    TODO:
    - UI Layout
    - SnackBar Navigation (Wallet, Metrics, Profile)
    ...

 */

class WalletMain extends StatelessWidget {
  const WalletMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Wallet Page'),
      ),
    );
  }
}