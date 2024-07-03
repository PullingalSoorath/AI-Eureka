import 'package:eureka/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  //Google SignIn
  signWithGoogle(context) async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(child: ThreeDotLoading()),
      );
      //Being Intractive  SignIn Process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      //Obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      //Create a new credential for user
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      Navigator.pop(context);
      //finally let's SignIn
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      Navigator.pop(context);
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Check your internet connection and try again!",
          ),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
