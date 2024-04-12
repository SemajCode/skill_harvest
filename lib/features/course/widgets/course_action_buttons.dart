import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/providers/course_provider.dart';
import 'package:skillharvest/features/course/providers/user_course_provider.dart';

class CourseActionButtons extends ConsumerStatefulWidget {
  const CourseActionButtons({super.key, required this.courseIndex});
  final int courseIndex;

  @override
  ConsumerState<CourseActionButtons> createState() =>
      _CourseActionButtonsState();
}

class _CourseActionButtonsState extends ConsumerState<CourseActionButtons> {
  void starCourse() {
    ref.read(courseProvider.notifier).star(widget.courseIndex);
    setState(() {});
  }

  void buyCourse() {
    ref.read(courseProvider.notifier).buy(widget.courseIndex);

    final paidCourse = ref.read(courseProvider)[widget.courseIndex];

    ref.read(userCourseProvider.notifier).addCourse(paidCourse);
    setState(() {});
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const UserCourses(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(courseProvider)[widget.courseIndex].isFavorite;
    final isPaid = ref.watch(courseProvider)[widget.courseIndex].isPaid;
    return Positioned(
      bottom: 0,
      child: Container(
        height: 80,
        width: pageWidth(context),
        decoration: BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 48),
                backgroundColor: Pallete.palePink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              onPressed: starCourse,
              child: isFavorite
                  ? const Icon(
                      Icons.star,
                      color: Pallete.vibrantOrange,
                    )
                  : const Icon(
                      Icons.star_border_outlined,
                      color: Pallete.vibrantOrange,
                    ),
            ),
            const Gap(12),
            isPaid
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(pageWidth(context) * 0.6, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      backgroundColor: Pallete.blueColor,
                      foregroundColor: Pallete.whiteColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Remove Course',
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(pageWidth(context) * 0.6, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      backgroundColor: Pallete.blueColor,
                      foregroundColor: Pallete.whiteColor,
                    ),
                    onPressed: buyCourse,
                    child: const Text(
                      'Buy Now',
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
