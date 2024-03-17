// ignore_for_file: use_build_context_synchronously

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

  void signInUser() async {
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
            'Welcome back to $appName',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        AuthTextField(
          hintText: "User ID",
          controller: usernameController,
          enableObscureText: false,
          obscureText: false,
        ),
        AuthTextField(
          hintText: "Password",
          controller: passwordController,
          enableObscureText: true,
          obscureText: true,
        ),
        TextButton(
          onPressed: () {
            //forget password
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const ChatScreen(),
            //   ),
            // );
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
    );
  }
}
