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
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Onboarding3()),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset('assets/backgrounds/one.png', // TODO: Replace with your image path
                      width: 397.68,
                      height: 323.14,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Monitor Progress',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'lato',
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Visualize your Saving Progress with the Most Intuitive Design',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'lato',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
          ],
        ),
      ),
    );
  }
}
