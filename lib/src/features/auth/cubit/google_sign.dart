import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignCustom {
  static Future<User?> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize();
      final GoogleSignInAccount? gUser = await GoogleSignIn.instance
          .authenticate();
      if (gUser == null) {
        return null;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(idToken: gAuth.idToken);

      final userCred = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final user = userCred.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print(e);
      throw FirebaseAuthException(code: e.message ?? 'Something went wrong !');
    }
  }
  static Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
  }
}
