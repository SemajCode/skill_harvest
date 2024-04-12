import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/progress_indicator.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/models/course.dart';

class UserCourseCard extends StatelessWidget {
  const UserCourseCard({
    super.key,
    required this.totalLessons,
    required this.coveredLessons,
    required this.color,
    required this.courseTitle,
    required this.course,
  });

  final String courseTitle;
  final int totalLessons;
  final int coveredLessons;
  final Color color;
  final Course course;

  @override
  Widget build(BuildContext context) {
    final double indicatorValue = calcProgress(coveredLessons, totalLessons);

    return SizedBox(
      height: 182,
      width: pageWidth(context) * 0.455,
      child: Card(
        color: color.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(20),
              LayoutBuilder(
                builder: (context, constraints) {
                  return CourseProgressIndicator(
                    value: indicatorValue,
                    color: color,
                  );
                },
              ),
              const Gap(9),
              const Text(
                'Completed',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const Gap(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$coveredLessons/$totalLessons',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      maxRadius: 22,
                      backgroundColor: color,
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 28,
                          color: Pallete.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
