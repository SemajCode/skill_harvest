import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/progress_indicator.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/providers/user_course_provider.dart';
import 'package:skillharvest/features/course/screens/selected_course.dart';
import 'package:skillharvest/models/course.dart';

class UserCourseCard extends ConsumerStatefulWidget {
  const UserCourseCard({
    super.key,
    required this.course,
    required this.courseIndex,
  });

  final Course course;
  final int courseIndex;

  @override
  ConsumerState<UserCourseCard> createState() => _UserCourseCardState();
}

class _UserCourseCardState extends ConsumerState<UserCourseCard> {
  @override
  Widget build(BuildContext context) {
    final coveredLessons = ref
        .watch(userCourseProvider.notifier)
        .noOfCompletedLessons(widget.courseIndex);
    final double indicatorValue = calcProgress(
      coveredLessons,
      widget.course.lessons.length,
    );
    Color color = progressColor(indicatorValue);

    return Card(
      color: color.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(8),
        // height: 190,
        // width: pageWidth(context) * 0.455,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.course.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20),
            CourseProgressIndicator(
              value: indicatorValue,
              color: color,
            ),
            const Gap(9),
            Text(
              getlessonProgress(coveredLessons, widget.course.lessons.length),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const Gap(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$coveredLessons/${widget.course.lessons.length}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => SelectedCourse(
                              courseIndex: widget.courseIndex,
                              isUserCourse: true,
                            ),
                          ),
                        )
                        .then((_) => {setState(() {})});
                  },
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
    );
  }
}
