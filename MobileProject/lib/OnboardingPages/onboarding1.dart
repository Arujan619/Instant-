import 'package:flutter/material.dart';
import '../OnboardingPages/onboarding1.dart';
import '../OnboardingPages/onboarding2.dart';
import '../OnboardingPages/onboarding3.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Onboarding3()),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
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
          // Text "Monitor Progress"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Monitor Progress',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Text "Visualize your Saving Progress with the Most Intuitive Design"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Visualize your Saving Progress with the Most Intuitive Design',
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
                    child: Icon(Icons.circle, color: Colors.deepPurple),
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
                    child: Icon(Icons.circle, color: Colors.grey),
                  ),
                ],
              ),
              // Next button
              IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Onboarding2()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}