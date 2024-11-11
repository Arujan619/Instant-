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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Instant+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with your profile picture asset
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'First Last',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Edit Profile'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Icon(Icons.share),
                              Text('Share'),
                            ],
                          ),
                          Column(
                            children: const [
                              Icon(Icons.compare_arrows),
                              Text('Transfer'),
                            ],
                          ),
                          Column(
                            children: const [
                              Icon(Icons.exit_to_app),
                              Text('Logout'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.notifications),
                            title: const Text('Notifications'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.account_balance_wallet),
                            title: const Text('Vault Accounts'),
                            subtitle: const Text('2 Vaults Open'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.security),
                            title: const Text('Security'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}