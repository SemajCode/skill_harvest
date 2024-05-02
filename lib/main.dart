// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/account/screens/profile.dart';
import 'package:skillharvest/features/auth/provider/auth_provider.dart';
import 'package:skillharvest/features/home/screens/home.dart';
import 'package:skillharvest/features/onboarding/screen/onboarding.dart';
import 'package:skillharvest/firebase_options.dart';
import 'package:skillharvest/models/course.dart';
import 'package:skillharvest/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // options: const FirebaseOptions(
    //   apiKey: "api key here",
    //   appId: "com.example.skillharvest",
    //   messagingSenderId: "messaging id",
    //   projectId: "skill-harvest-105d3",
    // ),
  );
  final document = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(CourseAdapter());
  Hive.registerAdapter(CourseLessonAdapter());
  Hive.registerAdapter(CategoryConstAdapter());
  await Hive.openBox('courseBox');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider).authState;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillHarvest',
      theme: Pallete.lightThemeMode,
      darkTheme: Pallete.darkThemeMode,
      themeMode: ThemeMode.light,
      home: StreamBuilder(
          stream: authState,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen(
                isWaiting: true,
              );
            }
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const Home();
            }
          }),
    );
  }
}
