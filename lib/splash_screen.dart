import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  void loadDelay(){
    Future.
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('StudyBuddy'),
            Gap(30),
            Text(
              'Your Gateway to Knowledge! Dive into a World of Learning Excellence.',
            ),
          ],
        ),
      ),
    );
  }
}
