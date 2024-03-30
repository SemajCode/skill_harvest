import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/features/course/widgets/popularity_tag.dart';

class CourseCover extends StatelessWidget {
  const CourseCover({
    super.key,
    required this.title,
    required this.isBestSelling,
    required this.svgImage,
  });

  final String title;
  final String svgImage;
  final bool isBestSelling;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: SizedBox(
        child: Stack(
          children: [
            SvgPicture.asset(
              svgImage,
              height: 224,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.visibility_off,
                    size: 20,
                  ),
                  const Gap(8),
                  isBestSelling ? const PopularityTag() : const SizedBox(),
                  const Gap(18),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
