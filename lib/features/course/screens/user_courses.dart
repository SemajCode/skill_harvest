import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/user_progress_card.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/providers/user_course_provider.dart';
import 'package:skillharvest/features/course/widgets/user_course_card.dart';

class UserCourses extends ConsumerWidget {
  const UserCourses({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCourse = ref.watch(userCourseProvider);
    final userCourseCards = userCourse
        .map((e) => UserCourseCard(
            totalLessons: e.noOfLessons,
            coveredLessons: e.completedLessons,
            color: randomColor(),
            courseTitle: e.title))
        .toList();
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
              height: pageHeight(context) * 0.76,
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  children: userCourseCards,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
