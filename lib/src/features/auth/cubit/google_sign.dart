import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance; // ? instance
  static final GoogleSignIn _googleSignIn =
      GoogleSignIn.instance; // ? google sign in instance
  static User? get currentUser => _auth.currentUser;
  static Future<User?> signInWithGoogle(bool signInBack) async {
    try {
      await GoogleSignIn.instance.initialize(
        clientId:
            '1025646682516-58gna92tnsuf8g05tkbee20l562fc4ih.apps.googleusercontent.com',
      );

      final googleUser = await _googleSignIn.authenticate(); // ? show diolog

      // ? if user is null
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      if (googleAuth.idToken == null) {
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('Error signing in with Google $error');
      }
      return null;
    }
  }

  static Future<void> signOut() async {
    GoogleAuthService._googleSignIn.signOut();
  }
}
