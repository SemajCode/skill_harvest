import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
    required this.title,
    required this.about,
    required this.totalDuration,
    required this.price,
    required this.noOfLessons,
  });

  final String title;
  final String about;
  final String totalDuration;
  final String price;
  final int noOfLessons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Gap(2),
                Text(
                  '$totalDuration · $noOfLessons lessons',
                  style: const TextStyle(
                    color: Pallete.greyText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Text(
              '\$ $price',
              style: const TextStyle(
                color: Pallete.blueColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Gap(18),
        const Text(
          'About this course',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(5),
        Text(
          about,
          style: const TextStyle(
            color: Pallete.greyText,
            fontSize: 12,
          ),
        ),
        const Gap(16),
      ],
    );
  }
}
