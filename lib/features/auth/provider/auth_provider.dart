import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/core/services/firebase/firebase_services.dart';

final FirebaseAuthMethods _firebaseAuthMethods =
    FirebaseAuthMethods(FirebaseAuth.instance);

final authProvider = Provider<FirebaseAuthMethods>((ref) {
  return _firebaseAuthMethods;
});
