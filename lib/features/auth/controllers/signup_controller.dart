import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/core/services/auth/firebase_auth_methods.dart';

final SignupController _signupController = SignupController();

class SignupController extends ChangeNotifier {
  bool isBusy = false;
  bool acceptTerms = false;

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    _isBusy(true);
    await FirebaseAuthMethods(FirebaseAuth.instance)
        .signUpWithEmail(context, email, password);
    _isBusy(false);
  }

  acceptT() {
    acceptTerms = !acceptTerms;
    notifyListeners();
  }

  _isBusy(bool isBusy) {
    this.isBusy = isBusy;
    notifyListeners();
  }
}

final signUpProvider = ChangeNotifierProvider((ref) => _signupController);
