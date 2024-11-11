import 'package:flutter/material.dart';
import '../SigninPage/signin-main.dart';

/*
    Description:
    - This is the Sign-up page of the app
    - User can sign up with Apple, Google, LinkedIn, or Email
    - User can also Sign in (show SigninPage)
    - After sign-up successful, next page brings user back to SigninPage

 */

/*
    TODO:
    - UI Layout
    - 'Sign up with Apple' button
    - 'Sign up with Google' button
    - 'Sign up with LinkedIn' button
    - 'Sign up with Email' button
    - 'Sign in' button

 */

class SignupMain extends StatelessWidget {
  const SignupMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Create your new account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'First name',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Last name',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement sign-up logic. For now, navigate to SigninMain
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SigninMain()),
                );
              },
              child: const Text('Sign up'),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.white),
            const Text(
              '----- Or sign up with -----',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement Google sign-up
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.link, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement LinkedIn sign-up
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.apple, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement Apple sign-up
                  },
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'If you have an account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SigninMain()),
                    );
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}