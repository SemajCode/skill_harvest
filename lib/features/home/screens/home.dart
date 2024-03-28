import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/constants/constant.dart';
import 'package:skillharvest/core/util/helper.dart';
import 'package:skillharvest/features/home/widgets/course_card.dart';
import 'package:skillharvest/features/home/widgets/learning_ads_items.dart';
import 'package:skillharvest/features/home/widgets/learning_plan_progress.dart';
import 'package:skillharvest/features/home/widgets/user_progress_card.dart';
import 'package:skillharvest/features/home/widgets/welcome_message.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
              child: Stack(
                children: [
                  WelcomeMessage(),
                  UserProgressCard(),
                ],
              ),
            ),
            SizedBox(
              height: 168,
              width: pageWidth(context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                clipBehavior: Clip.hardEdge,
                itemBuilder: (context, index) => const LearningAdsItems(),
              ),
            ),
            const LearningPlanProgress(),
            const CourseCard(),
          ],
        ),
      ),
    );
  }
}
