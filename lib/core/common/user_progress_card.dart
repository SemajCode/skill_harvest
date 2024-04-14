import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/progress_indicator.dart';
import 'package:skillharvest/features/course/screens/user_courses.dart';

class UserProgressCard extends StatelessWidget {
  const UserProgressCard({
    super.key,
    required this.indicatorColor,
    required this.totalDailyDuration,
    required this.coveredDailyDuration,
    required this.indicatorValue,
    required this.isHome,
  });

  final Color indicatorColor;
  final int totalDailyDuration;
  final int coveredDailyDuration;
  final double indicatorValue;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallete.whiteColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Learned today',
                  style: TextStyle(
                    color: Pallete.greyText,
                    fontSize: 12,
                  ),
                ),
                isHome
                    ? InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserCourses(),
                          ));
                        },
                        child: const Text(
                          'My courses',
                          style: TextStyle(
                            color: Pallete.blueColor,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            Text.rich(
              TextSpan(
                text: '${coveredDailyDuration}min',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: '/${totalDailyDuration}min',
                    style: const TextStyle(
                      color: Pallete.greyText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            UserProgressIndicator(
              color: indicatorColor,
              value: indicatorValue,
            )
          ],
        ),
      ),
    );
  }
}
