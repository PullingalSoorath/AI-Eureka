import 'package:eureka/widgets/auth_text_field.dart';
import 'package:eureka/widgets/auth_button.dart';
import 'package:eureka/widgets/sign_signup_text_btn.dart';
import 'package:eureka/util/app_const.dart';
import 'package:flutter/material.dart';

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/google.png',
                    height: 24.0,
                    width: 24,
                  ),
                ),
              ),
            ),
            AccountAuthText(
              text1: "If you don't have an account? ",
              text2: "Sign In",
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

class SignUpAuth extends StatelessWidget {
  const SignUpAuth({
    super.key,
  });

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
        const AuthTextField(
          hintText: "User ID",
        ),
        const AuthTextField(
          hintText: "Password",
        ),
        const AuthTextField(
          hintText: "Confirm Password",
        ),
        TextButton(
          onPressed: () {
            //forget password
          },
          child: const Text(
            'Forget Password?',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        AuthButton(
          buttonName: "Sign Up",
          onTap: () {},
        ),
      ],
    );
  }
}

class SignInAuth extends StatelessWidget {
  const SignInAuth({
    super.key,
  });

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
        const AuthTextField(
          hintText: "User ID",
        ),
        const AuthTextField(
          hintText: "Password",
        ),
        TextButton(
          onPressed: () {
            //forget password
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
          onTap: () {},
        ),
      ],
    );
  }
}
