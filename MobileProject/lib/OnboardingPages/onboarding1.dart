import 'package:flutter/material.dart';
import '../OnboardingPages/onboarding2.dart';

/*
    Description:
    - This is the first onboarding page
    - Next page shows Onboarding2
 */

/*
    TODO:
    - UI Layout
    - 'Skip' button
    - 'Next' button
    - Don't Allow for back navigation
 */

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding Page 1'),
      ),
    );
  }
}