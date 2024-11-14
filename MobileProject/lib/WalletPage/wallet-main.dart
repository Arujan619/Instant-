import 'package:flutter/material.dart';
import 'wallet-cards.dart';

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

const double kCardHeight = 225;
const double kCardWidth = 356;

const double kSpaceBetweenCard = 24;
const double kSpaceBetweenUnselectCard = 32;
const double kSpaceUnselectedCardToTop = 290;

const Duration kAnimationDuration = Duration(milliseconds: 245);

class WalletMain extends StatefulWidget {
  const WalletMain({super.key});

  @override
  _WalletMainState createState() => _WalletMainState();
}

class _WalletMainState extends State<WalletMain> {
  int? selectedCardIndex = 0;

  final List<VaultCardData> cardsData = [
    VaultCardData(
      gradient: LinearGradient(
        colors: [Color(0xFFEF07C8), Color(0xFF111735)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    VaultCardData(
      gradient: LinearGradient(
        colors: [Colors.indigo, Color(0xFF111735)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    VaultCardData(
      gradient: LinearGradient(
        colors: [Color(0xFFE10A3C), Color(0xFF06195A)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    VaultCardData(
      gradient: LinearGradient(
        colors: [Color(0xFF111735), Color(0xFF0B30EA)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    VaultCardData(
      gradient: LinearGradient(
        colors: [Color(0xFF09E6FA), Color(0xFF0625E1)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ];

  late final List<VaultCard> vaultCards;

  @override
  void initState() {
    super.initState();
    vaultCards = cardsData
        .map((data) => VaultCard(gradient: data.gradient))
        .toList();
  }

  int toUnselectedCardPositionIndex(int indexInAllList) {
    if (selectedCardIndex != null) {
      if (indexInAllList < selectedCardIndex!) {
        return indexInAllList;
      } else {
        return indexInAllList - 1;
      }
    } else {
      throw 'Wrong usage';
    }
  }

  double _getCardTopPositioned(int index, bool isSelected) {
    if (selectedCardIndex != null) {
      if (isSelected) {
        return kSpaceBetweenCard;
      } else {
        return kSpaceUnselectedCardToTop +
            toUnselectedCardPositionIndex(index) * kSpaceBetweenUnselectCard;
      }
    } else {
      return kSpaceBetweenCard + index * kCardHeight + index * kSpaceBetweenCard;
    }
  }

  double _getCardScale(int index, bool isSelected) {
    if (selectedCardIndex != null) {
      if (isSelected) {
        return 1.0;
      } else {
        int totalUnselectCard = vaultCards.length - 1;
        return 1.0 -
            (totalUnselectCard - toUnselectedCardPositionIndex(index) - 1) *
                0.05;
      }
    } else {
      return 1.0;
    }
  }

  double totalHeightTotalCard() {
    if (selectedCardIndex == null) {
      final totalCard = vaultCards.length;
      return kSpaceBetweenCard * (totalCard + 1) + kCardHeight * totalCard;
    } else {
      return kSpaceUnselectedCardToTop +
          kCardHeight +
          (vaultCards.length - 2) * kSpaceBetweenUnselectCard +
          kSpaceBetweenCard;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

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

            // + ADD Account Button
            Positioned(
              top: 70,
              left: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'ADD Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),

            // Background box card
            Positioned(
              top: 410,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Color(0xFF191326),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            // Cards
            Positioned(
              top: 110,
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox.expand(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: kAnimationDuration,
                        height: totalHeightTotalCard(),
                        width: mediaQuery.size.width,
                      ),
                      for (int i = 0; i < vaultCards.length; i++)
                        AnimatedPositioned(
                          top: _getCardTopPositioned(i, i == selectedCardIndex),
                          duration: kAnimationDuration,
                          child: Center(
                            child: AnimatedScale(
                              scale: _getCardScale(i, i == selectedCardIndex),
                              duration: kAnimationDuration,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCardIndex = i;
                                    });
                                  },
                                  child: vaultCards[i],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}