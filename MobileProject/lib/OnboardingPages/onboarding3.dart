import 'package:flutter/material.dart';
import '../OnboardingPages/onboarding1.dart';
import '../OnboardingPages/onboarding2.dart';
import '../OnboardingPages/onboarding3.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          // Text "Money Management"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Money Management',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Text "Organizing your Goals based on Your Needs"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Organizing your Goals based on Your Needs',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Bottom navigation and next button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // App drawer navigation
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Onboarding1()),
                      );
                    },
                    child: Icon(Icons.circle, color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Onboarding2()),
                      );
                    },
                    child: Icon(Icons.circle, color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Onboarding3()),
                      );
                    },
                    child: Icon(Icons.circle, color: Colors.deepPurple),
                  ),
                ],
              ),
              // Next button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SigninMain()),
                  );
                },
                child: const Text('Get Started'),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}