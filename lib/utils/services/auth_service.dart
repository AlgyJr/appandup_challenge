import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final fbAuth = FacebookAuth.instance;

  bool isLoggedIn() => auth.currentUser != null;

  String? userId() => auth.currentUser?.uid;

  String? email() => auth.currentUser?.email;

  Future<void> signup(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too week.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too week.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> loginWithFacebook() async {
    final LoginResult result = await fbAuth.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.token);

      auth.signInWithCredential(facebookAuthCredential);
    } else {
      print(result.status);
    }
  }

  Future<void> loginWithFacebookWeb() async {
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({'display': 'popup'});

    await auth.signInWithPopup(facebookProvider);
  }

  void logout() async {
    await auth.signOut();
    notifyListeners();
  }
}
