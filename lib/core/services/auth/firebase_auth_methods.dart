import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  Future<void> signiUpWithEmail(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message!);
      }
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      if (context.mounted) {
        showSnackBar(context, 'Email verification sent!');
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message!);
      }
    }
  }

  Future<void> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  ) async {
    if (_auth.currentUser!.emailVerified) {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      sendEmailVerification(context);
    }
  }
}
