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
      appBar: AppBar(
        title: const Text('Sign-up Page'),
      ),
    );
  }
}