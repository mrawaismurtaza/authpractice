import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  FirebaseAuth auth = FirebaseAuth.instance;

  final GoogleSignIn signIn = GoogleSignIn.instance;

  Future<bool> signInWithGoogle() async {
    String webClientId = "564327617692-ltf480snt2ps781u79qbhhh0tv30olk7.apps.googleusercontent.com";
    await signIn.initialize(serverClientId: webClientId);
    GoogleSignInAccount account = await signIn.authenticate();

    if (account == null) {
      throw Exception("Google sign-in failed");
    }

    GoogleSignInAuthentication googleAuth = await account.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    auth.signInWithCredential(credential);

    return true;
  }
}