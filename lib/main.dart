// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/auth/screens/login.dart';
import 'package:skillharvest/features/course/screens/course.dart';
import 'package:skillharvest/features/course/screens/selected_course.dart';
import 'package:skillharvest/features/course/screens/user_courses.dart';
import 'package:skillharvest/features/home/screens/home.dart';
import 'package:skillharvest/splash_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillHarvest',
      theme: Pallete.lightThemeMode,
      darkTheme: Pallete.darkThemeMode,
      themeMode: ThemeMode.light,
      home: const UserCourses(),
    );
  }
}
