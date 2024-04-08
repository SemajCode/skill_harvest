import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/splash_screen.dart';

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
      home: const SplashScreen(),
    );
  }
}
