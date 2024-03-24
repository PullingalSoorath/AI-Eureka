import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eureka/application/signIn_signUp/sign_in_sign_up_bloc.dart';
import 'package:eureka/services/auth_service.dart';
import 'package:eureka/widgets/sign_signup_text_btn.dart';
import 'package:eureka/widgets/google_image_button.dart';
import 'sign_in_auth.dart';
import 'sign_up_auth.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInSignUpBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          title: BlocBuilder<SignInSignUpBloc, SignInSignUpState>(
            builder: (context, state) {
              return Text(
                state.signIn ? "Sign Up" : "Sign In",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<SignInSignUpBloc, SignInSignUpState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  state.signIn ? const SignUpAuth() : const SignInAuth(),
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
                    text1: state.signIn
                        ? "Already have an account? "
                        : "If you don't have an account? ",
                    text2: state.signIn ? "Sign In" : "Sign Up",
                    onTap: () {
                      BlocProvider.of<SignInSignUpBloc>(context)
                          .add(ToggleSignInEvent());
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
