// ignore_for_file: use_build_context_synchronously

import 'package:eureka/services/auth_service.dart';
import 'package:eureka/widgets/sign_signup_text_btn.dart';
import 'package:flutter/material.dart';
import '../../widgets/google_image_button.dart';
import 'sign_in_auth.dart';
import 'sign_up_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _signIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          _signIn ? "Sign Up" : "Sign In",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            _signIn ? const SignUpAuth() : const SignInAuth(),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Text('Or continue with'),
            ),
            GoogleImageButton(
              onTap: () => AuthServices().signWithGoogle(context),
            ),
            AccountAuthText(
              text1: "If you don't have an account? ",
              text2: _signIn ? "Sign In" : "Sign Up",
              onTap: () {
                setState(() {
                  _signIn = !_signIn;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
