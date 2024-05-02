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
    await ref
        .read(firebaseServiceProvider)
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

  Future<void> addProfile({
    required File? image,
    required String displayName,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    _isBusy(true);
    final user = ref.read(firebaseServiceProvider).user;
    await ref.read(firebaseServiceProvider).addProfile(
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
