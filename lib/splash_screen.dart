import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loadDelay();
    super.initState();
  }

  void loadDelay() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Onboarding(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('StudyBuddy',
                    textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Pallete.blueColor),
                    speed: const Duration(milliseconds: 300)),
              ],
            ),
            const Gap(20),
            const Text(
              'Your Gateway to Knowledge!\nDive into a World of Learning Excellence.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
