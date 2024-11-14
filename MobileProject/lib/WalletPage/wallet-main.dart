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
        ),
        body: Stack(
          children: [
            // Title
            Positioned(
              top: 0,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Wallet',
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
            // AddAccount Button
            Positioned(
              top: 100,
              left: 16,
              child: TextButton.icon(
                onPressed: () {
                  // TODO: Implement AddAccount functionality
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 45,
                ),
                label: const Text(
                  'ADD Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            // List of VaultCards
            Positioned(
              top: 160,
              left: 16,
              right: 16,
              child: Column(
                children: const [
                  VaultCard(),
                  SizedBox(height: 16),
                  VaultCard(),
                  SizedBox(height: 16),
                  VaultCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VaultCard extends StatelessWidget {
  const VaultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 198,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2887), Color(0xFF7E1D9C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Edit Button
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: const Icon(
                Icons.edit_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          // Vault Name
          Positioned(
            top: 16,
            left: 16,
            child: const Text(
              'School Trip',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          // Remaining Days
          Positioned(
            top: 40,
            left: 16,
            child: const Text(
              '38 Days Remaining',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          // Vault Image
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              width: 81,
              height: 81,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image(
                  image: AssetImage('assets/temporary/vault_image.png'),
                  width: 81,
                  height: 81,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Goal Column
          Positioned(
            bottom: 16,
            left: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '\$5000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          // Balance Column
          Positioned(
            bottom: 16,
            left: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '\$2000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}