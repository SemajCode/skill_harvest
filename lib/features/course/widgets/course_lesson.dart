import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/course/controllers/video_controller.dart';
import 'package:skillharvest/features/course/providers/course_provider.dart';
import 'package:skillharvest/features/course/providers/user_course_provider.dart';
import 'package:skillharvest/models/course.dart';

class CourseLesson extends ConsumerStatefulWidget {
  const CourseLesson({
    super.key,
    required this.courseLessonIndex,
    required this.course,
  });

  final int courseLessonIndex;
  final Course course;

  @override
  ConsumerState<CourseLesson> createState() => _CourseLessonState();
}

class _CourseLessonState extends ConsumerState<CourseLesson> {
  void toggleLessonCompletion(Course course, int lessonIndex) {
    bool isLocked = course.lessons[lessonIndex].isLocked;
    if (!isLocked) {
      if (course.isPaid) {
        ref
            .read(userCourseProvider.notifier)
            .toggleLessonCompletion(course, lessonIndex);
        ref.read(courseProvider.notifier).toggleLessonCompletion(
              course,
              lessonIndex,
            );
        setState(() {});
      }
      ref.read(courseProvider.notifier).toggleLessonCompletion(
            course,
            lessonIndex,
          );
      setState(() {});
    }
    setState(() {});
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final courseLesson = widget.course.lessons[widget.courseLessonIndex];
    final String title = courseLesson.title;
    final String duration = courseLesson.duration;
    final bool isLocked = courseLesson.isLocked;
    final int lessonNo = courseLesson.lessonNumber;
    final bool isCompleted = courseLesson.isCompleted;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  height: 26,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Checkbox(
                          activeColor: Pallete.blueColor,
                          value: isCompleted,
                          onChanged: (value) {
                            toggleLessonCompletion(
                              widget.course,
                              widget.courseLessonIndex,
                            );
                          },
                        ),
                      ),
                      const Gap(8),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Pallete.blueColor,
                        ),
                      ),
                    ],
                  ),
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
