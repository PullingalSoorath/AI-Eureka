import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  //Google SignIn
  signWithGoogle() async {
    //Being Intractive  SignIn Process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //Obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //Create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    //finally let's SignIn
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
