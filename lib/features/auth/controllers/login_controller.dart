import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/features/auth/provider/auth_provider.dart';

// final LoginController _loginController = LoginController();

class LoginController extends ChangeNotifier {
  bool isBusy = false;
  final Ref ref;

  LoginController({required this.ref});

  Future<void> emailLogin(
      String password, String email, BuildContext context) async {
    _isBusy(true);
    await ref.read(authProvider).signInWithEmail(
          context,
          email,
          password,
        );

    _isBusy(false);
  }

  Future<void> googleLogin(BuildContext context) async {
    _isBusy(true);
    await ref.read(authProvider).signInWithGoogle(context);
    _isBusy(false);
  }

  _isBusy(bool isBusy) {
    this.isBusy = isBusy;
    notifyListeners();
  }
}

final loginProvider = ChangeNotifierProvider((ref) {
  return LoginController(ref: ref);
});
