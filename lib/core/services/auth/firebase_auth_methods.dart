import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  Stream<User?> get authState => _auth.authStateChanges();
  User? get user => _auth.currentUser!;

  Future<void> signUpWithEmail(
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
        showSnackBar(context, e.message ?? 'Authentication failed');
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
        showSnackBar(context, e.message ?? 'Email verification failed');
      }
    }
  }

  Future<void> addProfile(
    File? image,
    String displayName,
    String phoneNumber,
    String nickName,
    User? user,
  ) async {
    //
  }

  Future<void> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? 'Authentication failed');
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            //
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? 'Authentication failed');
      }
    }
  }
}
