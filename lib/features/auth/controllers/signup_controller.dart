import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/features/auth/provider/auth_provider.dart';

class SignupController extends ChangeNotifier {
  bool isBusy = false;
  bool acceptTerms = false;
  final Ref ref;

  SignupController({required this.ref});

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    _isBusy(true);
    await ref.read(authProvider).signUpWithEmail(context, email, password);
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

final signUpProvider =
    ChangeNotifierProvider((ref) => SignupController(ref: ref));
