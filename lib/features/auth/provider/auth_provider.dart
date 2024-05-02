import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/core/services/firebase/firebase_services.dart';

final FirebaseMethods _firebaseAuthMethods = FirebaseMethods(
  FirebaseAuth.instance,
  FirebaseFirestore.instance,
  FirebaseStorage.instance,
);

final firebaseServiceProvider = Provider<FirebaseMethods>((ref) {
  return _firebaseAuthMethods;
});
