import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/user_progress_card.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/providers/user_course_provider.dart';
import 'package:skillharvest/features/course/widgets/user_course_card.dart';

class UserCourses extends ConsumerStatefulWidget {
  const UserCourses({super.key});

  @override
  ConsumerState<UserCourses> createState() => _UserCoursesState();
}

class _UserCoursesState extends ConsumerState<UserCourses> {
  @override
  Widget build(BuildContext context) {
    final userCourse = ref.watch(userCourseProvider);
    Widget contents = userCourse.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImage.noData, height: 160),
                const Text(
                  'No Course',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Gap(8),
                const Text('You do not have any course yet!'),
              ],
            ),
          )
        : GridView.builder(
            itemCount: userCourse.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final course = userCourse[index];
              return UserCourseCard(
                courseIndex: index,
                course: course,
              );
            },
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        centerTitle: true,
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserProgressCard(
              isHome: false,
              coveredDailyDuration: 46,
              totalDailyDuration: 60,
              indicatorValue: 0.8,
              indicatorColor: Pallete.orangeColor,
            ),
            const Gap(16),
            //UserCourseCards
            SizedBox(
              height: pageHeight(context) * 0.72,
              width: pageWidth(context),
              child: contents,
            ),
          ],
        ),
      ),
    );
  }
}
