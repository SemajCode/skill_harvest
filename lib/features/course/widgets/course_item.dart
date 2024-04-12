import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    super.key,
    required this.courseTitle,
    required this.courseValue,
    required this.facilitator,
    required this.duration,
    required this.courseIndex,
  });

  final String courseTitle;
  final String courseValue;
  final String facilitator;
  final String duration;
  final int courseIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      height: 96,
      decoration: BoxDecoration(
          color: Pallete.offWhiteColor,
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: Pallete.greyText,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const Gap(24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                truncateText(courseTitle, 22, 2),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.supervised_user_circle_sharp,
                    color: Pallete.greyText,
                    size: 12,
                  ),
                  const Gap(4),
                  Text(
                    facilitator,
                    style:
                        const TextStyle(fontSize: 12, color: Pallete.greyText),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$$courseValue',
                    style: const TextStyle(
                      color: Pallete.blueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(6),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Pallete.onPurpleBackground,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        color: Pallete.orangeColor,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
