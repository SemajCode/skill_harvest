import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/user_progress_card.dart';
import 'package:skillharvest/features/course/widgets/user_course_card.dart';

class UserCourses extends StatelessWidget {
  const UserCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        centerTitle: true,
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            UserProgressCard(
              coveredDailyDuration: 46,
              totalDailyDuration: 60,
              indicatorValue: 0.8,
              indicatorColor: Pallete.orangeColor,
            ),
            Gap(16),
            //UserCourseCards
            Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: [
                UserCourseCard(
                  courseTitle: 'Java Development',
                  coveredLessons: 12,
                  totalLessons: 18,
                  color: Pallete.blueColor,
                ),
                UserCourseCard(
                  courseTitle: 'Web development',
                  coveredLessons: 12,
                  totalLessons: 18,
                  color: Pallete.orangeColor,
                ),
                UserCourseCard(
                  courseTitle: 'Mobile Development',
                  coveredLessons: 12,
                  totalLessons: 18,
                  color: Pallete.purpleColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
