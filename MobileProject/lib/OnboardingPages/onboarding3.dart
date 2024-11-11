import 'package:flutter/material.dart';
import '../SigninPage/signin-main.dart';

/*
    Description:
    - This is the third onboarding page
    - Next page shows Sign-in Page
 */

/*
    TODO:
    - UI Layout
    - 'Get Started' button
    - Allow for back navigation

 */

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding Page 3'),
      ),
    );
  }
}