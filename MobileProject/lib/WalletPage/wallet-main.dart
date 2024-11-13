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
                  'The Vault',
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
      ),
    );
  }
}