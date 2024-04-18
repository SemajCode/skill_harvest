import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.showButton,
  });

  final String image;
  final String title;
  final String description;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          image,
          height: 260,
          width: 260,
        ),
        const Gap(20),
        SizedBox(
          width: 200,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Gap(16),
        SizedBox(
          width: 240,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Pallete.greyText,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
