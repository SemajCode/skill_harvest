import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';

class PlanProgressItem extends StatelessWidget {
  const PlanProgressItem({
    super.key,
    required this.title,
    required this.totalVideos,
    required this.coveredVideos,
  });

  final String title;
  final int totalVideos;
  final int coveredVideos;

  @override
  Widget build(BuildContext context) {
    final double progressValue = coveredVideos / totalVideos;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(
                  color: Pallete.lAccentColor,
                  value: progressValue,
                  backgroundColor: Pallete.onBlueBackground,
                ),
              ),
              const Gap(8),
              Text(title),
            ],
          ),
          Text.rich(
            TextSpan(
              text: '$coveredVideos',
              style: const TextStyle(),
              children: [
                TextSpan(
                  text: '/$totalVideos',
                  style: const TextStyle(
                    color: Pallete.greyText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
