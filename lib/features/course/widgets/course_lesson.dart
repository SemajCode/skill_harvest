import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/course/controllers/video_controller.dart';
import 'package:skillharvest/features/course/providers/course_provider.dart';
import 'package:skillharvest/features/course/providers/user_course_provider.dart';

class CourseLesson extends ConsumerWidget {
  const CourseLesson({
    super.key,
    required this.courseLessonIndex,
    required this.courseIndex,
    required this.isUserCourse,
  });

  final int courseLessonIndex;
  final bool isUserCourse;
  final int courseIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseLesson = isUserCourse
        ? ref.watch(userCourseProvider)[courseIndex].lessons[courseLessonIndex]
        : ref.watch(courseProvider)[courseIndex].lessons[courseLessonIndex];
    final String title = courseLesson.title;
    final String duration = courseLesson.duration;
    final bool isLocked = courseLesson.isLocked;
    final int lessonNo = courseLesson.lessonNumber;
    final bool isCompleted = courseLesson.isCompleted;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$lessonNo',
            style: const TextStyle(
              fontSize: 24,
              color: Pallete.greyText,
            ),
          ),
          SizedBox(
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                const Gap(4),
                Row(
                  children: [
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Pallete.blueColor,
                      ),
                    ),
                    const Gap(5),
                    isCompleted
                        ? const Icon(
                            Icons.check_circle_rounded,
                            size: 14,
                            color: Pallete.blueColor,
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
          isLocked
              ? const SizedBox(
                  width: 40,
                  child: CircleAvatar(
                    backgroundColor: Pallete.onBlueBackground,
                    maxRadius: 19,
                    child: Icon(
                      Icons.lock_rounded,
                      size: 22,
                      color: Pallete.whiteColor,
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    ref
                        .read(playVideoProvider.notifier)
                        .update((state) => !state);
                  },
                  child: const SizedBox(
                    width: 40,
                    child: Icon(
                      Icons.play_circle,
                      size: 44,
                      color: Pallete.blueColor,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
