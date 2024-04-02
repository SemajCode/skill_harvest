// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/auth/screens/login.dart';
import 'package:skillharvest/features/auth/screens/signup.dart';
import 'package:skillharvest/features/course/screens/course.dart';
import 'package:skillharvest/features/course/screens/selected_course.dart';
import 'package:skillharvest/features/course/widgets/lessons_video_player.dart';
import 'package:skillharvest/features/home/screens/home.dart';
import 'package:skillharvest/features/payment/screens/add_card.dart';
import 'package:skillharvest/features/payment/screens/payment_cards.dart';
import 'package:skillharvest/splash_screen.dart';
// import 'package:skillharvest/splash_screen.dart';

void main() {
  runApp(const MyApp());
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
      home: const AddCard(),
    );
  }
}
