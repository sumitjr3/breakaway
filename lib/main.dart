import 'package:breakaway/views/auth/login.dart';
import 'package:breakaway/views/initial/splash_screen.dart';
import 'package:breakaway/views/main/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/routes.dart';
import 'views/auth/sigup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        loginRoute: (context) => LoginPage(),
        siguproute: (context) => SignupPage(),
        homepageRoute: (context) => const HomePage(),
      },
    );
  }
}
