// ignore_for_file: use_build_context_synchronously

import 'package:eureka/util/app_const.dart';
import 'package:eureka/widgets/auth_button.dart';
import 'package:eureka/widgets/auth_text_field.dart';
import 'package:eureka/widgets/loading_widget.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: ThreeDotLoading(),
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
    } else {
      errorMessage('Please fill all the fields');
    }
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to $appName',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          AuthTextField(
            hintText: "Email ID",
            controller: _usernameController,
            enableObscureText: false,
            obscureText: false,
            validator: (value) => validateEmail(value),
          ),
          AuthTextField(
            hintText: "Password",
            controller: _passwordController,
            enableObscureText: true,
            obscureText: true,
            validator: (value) => validatePassword(value),
          ),
          AuthTextField(
            hintText: "Confirm Password",
            controller: _conformPasswordController,
            enableObscureText: true,
            obscureText: true,
            validator: (value) => validatePassword(value),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: AuthButton(
              buttonName: "Sign Up",
              onTap: signUpUser,
            ),
          ),
        ],
      ),
    );
  }

  // Email Validatiom
  String? validateEmail(String? value) {
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
  String? validatePassword(String? value) {
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
}
