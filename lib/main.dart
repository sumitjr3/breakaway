import 'package:breakaway/auth/auth_controller.dart';
import 'package:breakaway/auth/login.dart';
import 'package:breakaway/auth/signup.dart';
import 'package:breakaway/constants/routes.dart';
import 'package:breakaway/firebase_options.dart';
import 'package:breakaway/views/home_page.dart';
import 'package:breakaway/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        homepageRoute: (context) => const HomePage(),
        loginRoute: (context) => LoginView(),
        signupRoute: (context) => SignupView(),
      },
    );
  }
}
