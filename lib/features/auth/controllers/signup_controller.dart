import 'dart:io';

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

  Future<void> addProfile(File? image, String displayName, String phoneNumber,
      BuildContext context) async {
    _isBusy(true);
    final user = ref.read(authProvider).user;
    await ref.read(authProvider).addProfile(
          context: context,
          image: image,
          displayName: displayName,
          phoneNumber: phoneNumber,
          user: user,
        );
    _isBusy(false);
  }
}

final signUpProvider =
    ChangeNotifierProvider((ref) => SignupController(ref: ref));
