import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/home/widgets/plan_progress_item.dart';

class LearningPlan extends StatelessWidget {
  const LearningPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learning Plan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(12),
          Card(
            color: Pallete.whiteColor,
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  PlanProgressItem(
                    title: 'Packaging Design',
                    coveredVideos: 40,
                    totalVideos: 48,
                  ),
                  PlanProgressItem(
                    title: 'Product Design',
                    coveredVideos: 6,
                    totalVideos: 24,
                  ),
                  PlanProgressItem(
                    title: 'Marketing',
                    coveredVideos: 19,
                    totalVideos: 24,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
