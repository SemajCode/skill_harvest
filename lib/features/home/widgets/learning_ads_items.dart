import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/constants/constant.dart';

class LearningAdsItems extends StatelessWidget {
  const LearningAdsItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Pallete.onBlueBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  AppImage.handIllustration,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What do you want to learn today?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.orangeColor,
                      foregroundColor: Pallete.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Get Started'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
