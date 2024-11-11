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
        title: const Text(
          'INSTANT+',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(''), // TODO: Add background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Image in the middle of the page
              Expanded(
                child: Center(
                  child: Image.asset(
                    'https://gratisography.com/wp-content/uploads/2024/10/gratisography-cool-cat-1035x780.jpg', // TODO: Replace with your image path
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              // Text "Start taking control of your finances!"
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Start taking control of your finances!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // "Get Started" button navigate to onboarding pages
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Onboarding1()),
                      );
                    },
                    child: const Text('Get Started'),
                  ),
                  const SizedBox(width: 15),
                  // Apple "Sign In" button
                  IconButton(
                    icon: const Icon(Icons.apple),
                    color: Colors.white,
                    onPressed: () {
                      // TODO: Apple sign in
                    },
                  ),
                  const SizedBox(width: 15),
                  // Google "Sign In" button
                  IconButton(
                    icon: const Icon(Icons.g_mobiledata),
                    color: Colors.white,
                    onPressed: () {
                      // TODO: Google sign in
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // App Version
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'App Version 1.0.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}