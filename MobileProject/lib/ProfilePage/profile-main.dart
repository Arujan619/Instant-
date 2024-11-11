import 'package:flutter/material.dart';
import '../HomePage/home-main.dart';
import '../WalletPage/wallet-main.dart';
import '../MetricsPage/metrics-main.dart';

/*
    Description:
    - ProfileMain is the main page for the profile page
    - Shows user information (name, phone number)
    - Allows to edit user information
    - Allows user to share profile
    - Allows user to transfer money in/out of account
    - Allows user to logout of account (brings back to LandingPage)
    - Allows user to view Notifications
    - Allows user to view Vault Accounts
    - Allows user to view Security Settings

 */

/*
    TODO:
    - UI Layout
    - "Edit Profile" Button
    - "Share Profile" Button
    - "Transfer Money" Button
    - "Logout" Button
    - "Notifications" Button
    - "Vault Accounts" Button
    - "Security Settings" Button
    - SnackBar Navigation (Wallet, Metrics, Profile)
    ...

 */

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
    );
  }
}