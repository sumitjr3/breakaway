import 'dart:async';
import 'package:breakaway/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delayed function to navigate to the main screen after 2 seconds
    void navigateToMainScreen() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              const HomePage(), // Replace MainScreen with your actual main screen
        ),
      );
    }

    // Schedule navigation after 2 seconds
    Timer(const Duration(seconds: 3), navigateToMainScreen);
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'lib/assets/logo.svg',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
