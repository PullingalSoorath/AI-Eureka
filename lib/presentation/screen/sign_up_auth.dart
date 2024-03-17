// ignore_for_file: use_build_context_synchronously

import 'package:eureka/util/app_const.dart';
import 'package:eureka/widgets/auth_button.dart';
import 'package:eureka/widgets/auth_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpAuth extends StatefulWidget {
  const SignUpAuth({
    super.key,
  });

  @override
  State<SignUpAuth> createState() => _SignUpAuthState();
}

class _SignUpAuthState extends State<SignUpAuth> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _conformPasswordController = TextEditingController();

  void errorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
        ),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }

  signUpUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (_passwordController.text == _conformPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _usernameController.text,
          password: _passwordController.text,
        );
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        errorMessage('Password does not match');
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Welcome to $appName',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        AuthTextField(
          hintText: "Email ID",
          controller: _usernameController,
          enableObscureText: false,
          obscureText: false,
        ),
        AuthTextField(
          hintText: "Password",
          controller: _passwordController,
          enableObscureText: true,
          obscureText: true,
        ),
        AuthTextField(
          hintText: "Confirm Password",
          controller: _conformPasswordController,
          enableObscureText: true,
          obscureText: true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: AuthButton(
            buttonName: "Sign Up",
            onTap: signUpUser,
          ),
        ),
      ],
    );
  }
}
