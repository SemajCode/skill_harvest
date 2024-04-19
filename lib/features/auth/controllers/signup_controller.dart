import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final SignupController _signupController = SignupController();

class SignupController extends ChangeNotifier {
  bool isBusy = false;
  bool acceptTerms = false;

  Future<void> signUp(String email, String password) async {
    _isBusy(true);
    await Future.delayed(const Duration(milliseconds: 900));
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
