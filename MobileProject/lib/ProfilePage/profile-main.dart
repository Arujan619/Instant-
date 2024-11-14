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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100), // Adjust height as needed
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            // Profile Card
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.black, Color(0xFF3852C7)],
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            width: 360,
                            height: 595,

                            // Profile Information
                            child: Column(
                              children: [
                                const SizedBox(height: 40), // Adjust height as needed
                                // First and Last Name
                                const Text(
                                  'Devon Lane',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // Phone Number
                                const Text(
                                  '(629) 555-0129',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Edit Profile Button
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(84, 20),
                                    backgroundColor: Colors.grey[800],
                                  ),
                                  child: const Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // Share, Transfer, Logout Buttons
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.send_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          'Share',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.compare_arrows_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          'Transfer',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.exit_to_app_rounded,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          'Log out',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                // Notifications, Vault Accounts, Security Settings
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
                          Positioned(
                            top: -40, // Adjust this value to control how much the avatar sticks out
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/temporary/profile_picture.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Profile',
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