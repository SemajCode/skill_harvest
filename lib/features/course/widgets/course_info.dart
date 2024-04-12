import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/providers/course_provider.dart';

class CourseInfo extends ConsumerWidget {
  const CourseInfo({
    super.key,
    required this.courseIndex,
  });
  final int courseIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = ref.watch(courseProvider)[courseIndex];
    final String title = course.title;
    final String about = course.description;
    final String totalDuration = course.duration;
    final String price = course.price;
    final int noOfLessons = course.noOfLessons;
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
                SizedBox(
                  width: pageWidth(context) * 0.65,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
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
