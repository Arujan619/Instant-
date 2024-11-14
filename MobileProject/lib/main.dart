import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'LandingPage/landing-main.dart';
import 'HomePage/home-main.dart';
import '../Authentication/widget-tree.dart';

/*
    Description:
    - This is the main file of the app
    - This file will be the first file that is run when the app is opened
    - This file will determine which page to show the user:
        - If the user is not logged in, show the LandingPage
        - If the user is logged in, show the HomePage
 */

/*
    TODO:
    - Change color scheme
    - If user not logged in, show LandingPage, else show HomePage. For now just show LandingPage
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instant+',
      theme: ThemeData(
        // TODO: Change color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // TODO: If user not logged in, show LandingPage, else show HomePage
      // TODO: for now just show LandingPage
      home: const LandingMain(),
      //TODO: home: const WidgetTree(),
    );
  }
}