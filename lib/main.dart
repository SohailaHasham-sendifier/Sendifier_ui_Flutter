
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/onborading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoScreen(),  // Set LogoScreen as the home screen
    );
  }
}

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay navigation to the next screen after 2 seconds (for splash screen effect)
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),  // Navigate to OnboardingScreen
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background1.png',  // Ensure the path is correct
              fit: BoxFit.cover,  // Cover the entire screen
            ),
          ),
          // Centered Logo
          Center(
            child: Image.asset(
              'assets/images/logo.png',  // Ensure the path is correct for the logo
              width: 300,  // Adjust width of the logo if needed
              height: 300,  // Adjust height of the logo if needed
            ),
          ),
        ],
      ),
    );
  }
}
