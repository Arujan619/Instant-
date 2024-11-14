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
        ),
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: RecentTransactions(),
            ),
            // Title
            Positioned(
              top: 0,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    'Instant+',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}