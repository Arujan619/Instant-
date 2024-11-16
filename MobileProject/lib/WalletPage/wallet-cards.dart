import 'package:flutter/material.dart';
import 'wallet-main.dart'; // Import the constants from wallet-main.dart

class VaultCardData {
  VaultCardData({
    required this.gradient,
    required this.name,
    required this.daysRemaining,
    required this.image,
    required this.goalAmount,
    required this.balanceAmount,
  });

  final Gradient gradient;
  final String name;
  final int daysRemaining;
  final Image image;
  final double goalAmount;
  final double balanceAmount;
}

class VaultCard extends StatelessWidget {
  const VaultCard({
    super.key,
    required this.gradient,
    required this.name,
    required this.daysRemaining,
    required this.image,
    required this.goalAmount,
    required this.balanceAmount,
  });

  final Gradient gradient;
  final String name;
  final int daysRemaining;
  final Image image;
  final double goalAmount;
  final double balanceAmount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: kCardWidth,
        height: kCardHeight,
        decoration: BoxDecoration(
          gradient: gradient,
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
                  color: Colors.transparent,
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
              child: Text(
                name,
                style: const TextStyle(
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
              child: Text(
                '$daysRemaining Days Remaining',
                style: const TextStyle(
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
                  child: image,
                ),
              ),
            ),
            // Goal Column
            Positioned(
              bottom: 16,
              left: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Goal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    '\$$goalAmount',
                    style: const TextStyle(
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
                children: [
                  const Text(
                    'Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    '\$$balanceAmount',
                    style: const TextStyle(
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
      ),
    );
  }
}