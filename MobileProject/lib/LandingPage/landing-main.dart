import 'package:flutter/material.dart';
import '../HomePage/home-main.dart';
import '../OnboardingPages/onboarding1.dart';
import '../SigninPage/signin-main.dart';

/*
    Description:
    - This is the landing page of the app
    - This page will be shown to the user when they first open the app
    - The user can sign in with Apple, Google, or Email
    - "Get Started" button will take the user to the onboarding pages
 */

/*
    TODO:
    - UI Layout
    - 'Get Started' button
    - Apple 'Sign In' button
    - Google 'Sign In' button
    - 'Sign In' button

 */


class LandingMain extends StatelessWidget {
  const LandingMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
    );
  }
}