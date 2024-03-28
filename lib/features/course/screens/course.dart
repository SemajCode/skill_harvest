import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/constants/constant.dart';
import 'package:skillharvest/features/course/widgets/choose_course.dart';
import 'package:skillharvest/features/course/widgets/course_category.dart';
import 'package:skillharvest/features/course/widgets/course_item.dart';
import 'package:skillharvest/features/course/widgets/search_text_field.dart';

class Course extends StatelessWidget {
  const Course({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Courses',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SvgPicture.asset(
              AppImage.avatarSvg,
              height: 50,
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTextField(),
          SizedBox(
            height: 94,
            child: ListView(
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              children: const [
                CourseCategory(
                  categoryImage: AppImage.languageIllus,
                  categoryText: 'Language',
                  color: Pallete.blueColor,
                ),
                Gap(16),
                CourseCategory(
                  categoryImage: AppImage.paintIllus,
                  categoryText: 'Painting',
                  color: Pallete.purpleColor,
                ),
              ],
            ),
          ),
          const ChooseCourse(),
          SizedBox(
            height: 325,
            child: ListView(
              children: const [
                CourseItem(
                  courseTitle: 'Product Design v1.0',
                  courseValue: '190',
                  facilitator: 'Robertson Connie',
                  totalHours: '14',
                ),
                CourseItem(
                  courseTitle: 'Java Development',
                  courseValue: '200',
                  facilitator: 'Nguyen Shane',
                  totalHours: '18',
                ),
                CourseItem(
                  courseTitle: 'Visual Design',
                  courseValue: '250',
                  facilitator: 'Bert Pullman',
                  totalHours: '16',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
