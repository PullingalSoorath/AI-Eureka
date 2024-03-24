part of 'sign_in_sign_up_bloc.dart';

class SignInSignUpState {
  bool signIn;
  SignInSignUpState({required this.signIn});
}
class SignInSignUpInitial extends SignInSignUpState {
  SignInSignUpInitial() : super(signIn: false);
}