import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/screens/course.dart';
import 'package:skillharvest/features/home/widgets/course_card.dart';
import 'package:skillharvest/features/home/widgets/learning_ads_items.dart';
import 'package:skillharvest/features/home/widgets/learning_plan.dart';
import 'package:skillharvest/core/common/user_progress_card.dart';
import 'package:skillharvest/features/home/widgets/welcome_message.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Pallete.blueColor,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 180,
            child: Stack(
              children: [
                WelcomeMessage(),
                Positioned(
                  left: 12,
                  right: 12,
                  top: 70,
                  child: UserProgressCard(
                    isHome: true,
                    coveredDailyDuration: 46,
                    indicatorValue: 0.6,
                    indicatorColor: Pallete.orangeColor,
                    totalDailyDuration: 60,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 164,
            width: pageWidth(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              clipBehavior: Clip.hardEdge,
              itemBuilder: (context, index) => const LearningAdsItems(),
              padding: const EdgeInsets.only(left: 16),
            ),
          ),
          const LearningPlan(),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CourseScreen(),
                ),
              );
            },
            child: const CourseCard(),
          ),
        ],
      ),
    );
  }
}
