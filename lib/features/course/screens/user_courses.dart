import 'package:flutter/material.dart';
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
    Widget contents = userCourse.isEmpty
        ? const Center(child: Text('You do not have any course yet!'))
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
                color: randomColor(),
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
