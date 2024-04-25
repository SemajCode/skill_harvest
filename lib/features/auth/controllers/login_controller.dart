import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/core/services/auth/firebase_auth_methods.dart';

final LoginController _loginController = LoginController();

class LoginController extends ChangeNotifier {
  bool isBusy = false;

  Future<void> login(
      String password, String email, BuildContext context) async {
    _isBusy(true);
    await FirebaseAuthMethods(FirebaseAuth.instance).signInWithEmail(
      context,
      email,
      password,
    );

    _isBusy(false);
  }

  _isBusy(bool isBusy) {
    this.isBusy = isBusy;
    notifyListeners();
  }
}

final loginProvider = ChangeNotifierProvider((ref) {
  return _loginController;
});
