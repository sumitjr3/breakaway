import 'dart:async';
import 'package:breakaway/auth/auth_controller.dart';
import 'package:breakaway/auth/login.dart';
import 'package:breakaway/constants/routes.dart';
import 'package:breakaway/views/homepage.dart';
import 'package:breakaway/views/navigation_views/community_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  AuthController _auth = AuthController();
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delayed function to navigate to the main screen after 2 seconds
    // void navigateToMainScreen() {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (_) {
    //       bool x = _auth.isLogin;
    //       if (x == false) {
    //         return LoginView();
    //       } else {
    //         return const HomePage();
    //       }
    //     }
    //         // Replace MainScreen with your actual main screen
    //         ),
    //   );
    // }

    // Schedule navigation after 2 seconds
    // Timer(const Duration(seconds: 3), navigateToMainScreen);
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/Logo.svg',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
