import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helper.dart';
import 'package:skillharvest/features/home/widgets/course_card.dart';
import 'package:skillharvest/features/home/widgets/learning_ads_items.dart';
import 'package:skillharvest/features/home/widgets/learning_plan.dart';
import 'package:skillharvest/features/home/widgets/user_progress_card.dart';
import 'package:skillharvest/features/home/widgets/welcome_message.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
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
                UserProgressCard(),
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
          const CourseCard(),
        ],
      ),
    );
  }
}
