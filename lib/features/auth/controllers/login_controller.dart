import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final LoginController _loginController = LoginController();

class LoginController extends ChangeNotifier {
  bool isBusy = false;

  Future<void> login(String password, String email) async {
    _isBusy(true);
    //Fake Api call
    await Future.delayed(const Duration(seconds: 3));

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
