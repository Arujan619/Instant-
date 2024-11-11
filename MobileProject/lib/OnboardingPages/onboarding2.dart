import 'package:flutter/material.dart';
import '../OnboardingPages/onboarding3.dart';

/*
    Description:
    - This is the second onboarding page
    - Next page shows Onboarding3
 */

/*
    TODO:
    - UI Layout
    - 'Skip' button
    - 'Next' button
    - Allow for back navigation

 */

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding Page 2'),
      ),
    );
  }
}