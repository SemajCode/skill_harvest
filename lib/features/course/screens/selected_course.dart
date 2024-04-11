import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/controllers/video_controller.dart';
import 'package:skillharvest/features/course/providers/course_provider.dart';
import 'package:skillharvest/features/course/widgets/course_action_buttons.dart';
import 'package:skillharvest/features/course/widgets/course_cover.dart';
import 'package:skillharvest/features/course/widgets/course_info.dart';
import 'package:skillharvest/features/course/widgets/course_lesson.dart';
import 'package:skillharvest/features/course/widgets/lessons_video_player.dart';

class SelectedCourse extends ConsumerStatefulWidget {
  const SelectedCourse({
    super.key,
    required this.courseIndex,
  });

  final int courseIndex;

  @override
  ConsumerState<SelectedCourse> createState() => _SelectedCourseState();
}

class _SelectedCourseState extends ConsumerState<SelectedCourse> {
  @override
  Widget build(BuildContext context) {
    bool isPlaying = ref.watch(playVideoProvider);
    final selectedCourse = ref.watch(courseProvider)[widget.courseIndex];

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Pallete.blueColor,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Pallete.palePink,
        toolbarHeight: 0,
        elevation: 0,
      ),
      backgroundColor: Pallete.palePink,
      body: Stack(
        children: [
          isPlaying
              ? Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 220,
                    child: Stack(
                      children: [
                        const LessonsVideoPlayer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              ref
                                  .watch(playVideoProvider.notifier)
                                  .update((state) => !state);
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Pallete.whiteColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : CourseCover(
                  title: selectedCourse.title,
                  isBestSelling: selectedCourse.isBestSelling,
                  svgImage: AppImage.selectedCourse,
                ),
          Positioned(
            bottom: 0,
            child: Container(
              height: pageHeight(context) * 0.7,
              width: pageWidth(context),
              decoration: BoxDecoration(
                color: Pallete.whiteColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CourseInfo(
                      title: selectedCourse.title,
                      about: selectedCourse.description,
                      totalDuration: selectedCourse.duration,
                      price: selectedCourse.price,
                      noOfLessons: selectedCourse.noOfLessons,
                    ),
                    const Center(
                      child: Icon(
                        Icons.visibility_off,
                        size: 14,
                      ),
                    ),
                    const Gap(16),
                    SizedBox(
                      height: 234,
                      width: pageWidth(context),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: selectedCourse.lessons.length,
                        itemBuilder: (context, index) {
                          final courseLesson = selectedCourse.lessons[index];
                          return CourseLesson(
                            title: courseLesson.title,
                            duration: courseLesson.duration,
                            isLocked: courseLesson.isLocked,
                            lessonNo: courseLesson.lessonNumber,
                            isCompleted: courseLesson.isCompleted,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const CourseActionButtons()
        ],
      ),
    );
  }
}
