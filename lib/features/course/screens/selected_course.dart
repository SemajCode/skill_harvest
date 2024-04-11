import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/controllers/video_controller.dart';
import 'package:skillharvest/features/course/widgets/course_action_buttons.dart';
import 'package:skillharvest/features/course/widgets/course_cover.dart';
import 'package:skillharvest/features/course/widgets/course_info.dart';
import 'package:skillharvest/features/course/widgets/course_lesson.dart';
import 'package:skillharvest/features/course/widgets/lessons_video_player.dart';

class SelectedCourse extends ConsumerStatefulWidget {
  const SelectedCourse({super.key});

  @override
  ConsumerState<SelectedCourse> createState() => _SelectedCourseState();
}

class _SelectedCourseState extends ConsumerState<SelectedCourse> {
  @override
  Widget build(BuildContext context) {
    bool isPlaying = ref.watch(playVideoProvider);

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
              : const CourseCover(
                  title: 'Product Design v1.0',
                  isBestSelling: true,
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
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CourseInfo(
                      title: 'Product Design',
                      about:
                          'Learn product validation, UI/UX practices, Google’s Design Sprint and the process for setting and tracking actionable metrics.',
                      totalDuration: '6h 14min',
                      price: '78.00',
                      noOfLessons: '24',
                    ),
                    Center(
                      child: Icon(
                        Icons.visibility_off,
                        size: 14,
                      ),
                    ),
                    Gap(16),
                    CourseLesson(
                      title: 'Welcome to the course',
                      duration: '6:10',
                      isLocked: false,
                      lessonNo: '01',
                      isCompleted: true,
                    ),
                    CourseLesson(
                      title: 'Process Overview',
                      duration: '6:10',
                      isLocked: false,
                      lessonNo: '02',
                      isCompleted: false,
                    ),
                    CourseLesson(
                      title: 'Discovery',
                      duration: '6:10',
                      isLocked: true,
                      lessonNo: '03',
                      isCompleted: false,
                    ),
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
