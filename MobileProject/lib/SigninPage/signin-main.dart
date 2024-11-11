import 'package:flutter/material.dart';
import '../SignupPage/signup-main.dart';
import '../HomePage/home-main.dart';

/*
    Description:
    - This is the Sign-in page of the app
    - User can sign in with Apple, Google, LinkedIn, or Email
    - User can also Sign up (show SignupPage)
    - User can select "Forgot Password" to reset password (shows ResetPasswordPage)
    - After sign-in successful, next page shows HomePage
 */

/*
    TODO:
    - UI Layout
    - 'Sign in with Apple' button
    - 'Sign in with Google' button
    - 'Sign in with LinkedIn' button
    - 'Sign in with Email' button
    - 'Sign up' button
    - 'Forgot Password' button

 */

class SigninMain extends StatelessWidget {
  const SigninMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-in Page'),
      ),
    );
  }
}