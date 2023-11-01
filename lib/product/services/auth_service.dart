import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasefullapp/product/utility/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/auth_user.dart';

// AuthenticationRepository
// authServiceProvider ile provider etcem.
class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.standard();
  int deneme = 10;

  Stream<AuthUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      // Eger firebaseUser null ise  bos nesne dondur.Bu sayede Sign in sayfasina yonlendir
      // Eger null degile iceri girmis kullaniciyi dondur. Bu sayede kullaniciyi iceri at
      deneme = 20;
      return firebaseUser == null
          ? AuthUser.empty
          : AuthUser(
              id: firebaseUser.uid,
              email: firebaseUser.email,
              name: firebaseUser.displayName,
              emailVerified: firebaseUser.emailVerified);
    });
  }

  // Creating Sign Up Method
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw SignUpWithEMailAndPasswordException(error.code);
    }
  }

  // Creating Sign In Method
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw SignInWithEMailAndPasswordException(error.code);
    }
  }

  // Creating forgotPassword Method
  Future<void> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      throw ForgetPasswordException(error.code);
    }
  }

  Future<bool?> signInWithGoogle() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        throw SignInWithGoogleException();
      }

      final googleSignInAuth = await googleSignInAccount.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuth.accessToken,
          idToken: googleSignInAuth.idToken);
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return userCredential.additionalUserInfo?.isNewUser;
    } on FirebaseAuthException catch (error) {
      throw SignInWithGoogleException();
    }
  }

  Future<void> signOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
    } on FirebaseAuthException catch (error) {
      throw SignOutException(error.code);
    }
  }
}
