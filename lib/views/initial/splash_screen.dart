import 'package:breakaway/constants/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(loginRoute, (route) => false);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset('assets/images/Logo.png'),
              Image.asset('assets/images/name.png'),
            ],
          ),
        ],
      ),
    );
  }
}
