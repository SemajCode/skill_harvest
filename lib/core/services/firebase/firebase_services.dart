import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/models/user.dart';

class FirebaseMethods {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  FirebaseMethods(this._auth, this._firestore, this._firebaseStorage);

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

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message!);
    }
  }

  Future<void> addProfile({
    required BuildContext context,
    required File? image,
    required String displayName,
    required String phoneNumber,
    required User? user,
  }) async {
    try {
      if (image != null) {
        final storageRef = _firebaseStorage
            .ref()
            .child('user_images')
            .child('${user!.uid}.jpg');
        await storageRef.putFile(image);
        final imageUrl = await storageRef.getDownloadURL();

        _firestore.collection('users').doc(user.uid).set({
          'username': displayName,
          'email': user.email,
          'image_url': imageUrl,
          'phone_number': phoneNumber,
        });
      }
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message!);
      }
    }
  }

  Future<UserModel> getUserProfile() async {
    final user = _auth.currentUser!;

    final userData = await _firestore.collection('users').doc(user.uid).get();

    final UserModel userModel = UserModel(
      displayName: userData.data()!['username'],
      imagePath: userData.data()!['image_url'],
      phoneNumber: userData.data()!['phone_number'],
      userCourses: [],
    );
    return userModel;
  }
}
