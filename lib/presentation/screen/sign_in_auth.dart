// ignore_for_file: use_build_context_synchronously

import 'package:eureka/presentation/screen/forget_password_screen.dart';
import 'package:eureka/widgets/auth_button.dart';
import 'package:eureka/widgets/auth_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../util/app_const.dart';

class SignInAuth extends StatefulWidget {
  const SignInAuth({
    super.key,
  });

  @override
  State<SignInAuth> createState() => _SignInAuthState();
}

class _SignInAuthState extends State<SignInAuth> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signInUser() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => Center(
            child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.background,
        )),
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        errorMessage(e.code);
        Navigator.pop(context);
      }
    }
  }

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

  // Email Validatiom
  String? validateEmail(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  //Password Validation
  String? validatePassword(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    final emailRegExp = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter the valid Password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome back to $appName',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          AuthTextField(
            hintText: "Email ID",
            controller: usernameController,
            enableObscureText: false,
            obscureText: false,
            validator: validateEmail, // Pass function reference
          ),
          AuthTextField(
            hintText: "Password",
            controller: passwordController,
            enableObscureText: true,
            obscureText: true,
            validator: validatePassword,
          ),
          TextButton(
            onPressed: () {
              // forget password
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordPage(),
                ),
              );
            },
            child: const Text(
              'Forget Password?',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          AuthButton(
            buttonName: "Sign In",
            onTap: signInUser,
          ),
        ],
      ),
    );
  }
}
