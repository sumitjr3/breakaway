import 'package:breakaway/auth/auth_controller.dart';
import 'package:breakaway/widgets/my_button.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = AuthController();
    return Scaffold(
      body: Center(
          child: MyButton(
              onTap: () {
                _auth.logout();
              },
              text: "logout")),
    );
  }
}
