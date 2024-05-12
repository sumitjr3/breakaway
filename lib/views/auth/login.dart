import 'package:breakaway/constants/routes.dart';
import 'package:breakaway/widgets/button.dart';
import 'package:breakaway/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.navigate_before),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/Logo.png'),
                const SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/name.png'),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            MyTextField(
              controller: emailController,
              input_icon: Icon(Icons.email_outlined),
              hintText: 'email',
              obsecure: false,
              backgroundColor: Color(0xffFFDEB9),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: passwordController,
              input_icon: Icon(Icons.password),
              hintText: 'password',
              obsecure: true,
              backgroundColor: Color(0xffFFDEB9),
            ),
            const SizedBox(
              height: 30,
            ),
            MyButton(
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                homepageRoute as Route<Object?>,
                (route) => false,
              ),
              textColor: Colors.white,
              backgroungColor: const Color(0xff7149C6),
              text: "LOGIN",
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(siguproute);
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(
                      color: Color(0xff7149C6),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "by continuing you agree to our",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User Agreement",
                  style: TextStyle(
                    color: Color(0xff7149C6),
                  ),
                ),
                Text(
                  " and ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                    color: Color(0xff7149C6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
