import 'package:flutter/material.dart';
import '../HomePage/home-main.dart';
import '../WalletPage/wallet-main.dart';
import '../MetricsPage/metrics-main.dart';
import 'edit-profile.dart';
import '../LandingPage/landing-main.dart';

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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                                    );
                                  },
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
                                    // Share
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
                                    Container(
                                      height: 70,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    // Transfer
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
                                    Container(
                                      height: 70,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    // Logout
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (context) => LandingMain()),
                                              (Route<dynamic> route) => false,
                                        );
                                      },
                                      child: Column(
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
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 45),
                                // Notifications, Vault Accounts, Security Settings
                                Column(
                                  children: const [
                                    NotificationsTile(),
                                    SizedBox(height: 15),
                                    VaultAccountsTile(),
                                    SizedBox(height: 15),
                                    SecurityTile(),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // Profile Picture
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
            // Title
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

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 68,
      decoration: BoxDecoration(
        color: const Color(0xFF20222B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        // Icon
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0A28F4), Color(0xFF73A3F8)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(
              Icons.notifications_none,
              color: Colors.grey,
              size: 23,
            ),
          ),
        ),
        // Title
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Arrow
        trailing: const Icon(
          Icons.arrow_forward_rounded,
          size: 30,
          color: Colors.white,
        ),
        onTap: () {},
      ),
    );
  }
}

class VaultAccountsTile extends StatelessWidget {
  const VaultAccountsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 68,
      decoration: BoxDecoration(
        color: const Color(0xFF20222B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        // Icon
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF95FE99), Color(0xFFF5FEB9)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(
              Icons.account_balance_wallet,
              color: Colors.grey,
              size: 23,
            ),
          ),
        ),
        // Title
        title: const Text(
          'Vault Accounts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Subtitle
        subtitle: const Text(
          '2 Vaults Open',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Arrow
        trailing: const Icon(
          Icons.arrow_forward_rounded,
          size: 30,
          color: Colors.white,
        ),
        onTap: () {},
      ),
    );
  }
}

class SecurityTile extends StatelessWidget {
  const SecurityTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 68,
      decoration: BoxDecoration(
        color: const Color(0xFF20222B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        // Icon
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFB223F6), Color(0xFFF89273)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(
              Icons.security,
              color: Colors.grey,
              size: 23,
            ),
          ),
        ),
        // Title
        title: const Text(
          'Security',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Arrow
        trailing: const Icon(
          Icons.arrow_forward_rounded,
          size: 30,
          color: Colors.white,
        ),
        onTap: () {},
      ),
    );
  }
}