import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/course/providers/user_course_provider.dart';
import 'package:skillharvest/features/home/widgets/plan_progress_item.dart';
import 'package:skillharvest/models/course.dart';

class LearningPlan extends ConsumerWidget {
  const LearningPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Course> learningPlan = ref.watch(userCourseProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Learning Plan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(12),
          Card(
            color: Pallete.whiteColor,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 110,
                child: learningPlan.isEmpty
                    ? const Center(
                        child: Text(
                          'You currently have no learning plan yet!',
                        ),
                      )
                    : ListView.builder(
                        itemCount: learningPlan.length,
                        itemBuilder: (context, index) {
                          final plan = learningPlan[index];
                          return PlanProgressItem(
                            title: plan.title,
                            totalVideos: plan.noOfLessons,
                            coveredVideos: ref
                                .watch(userCourseProvider.notifier)
                                .noOfCompletedLessons(index),
                          );
                        },
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
