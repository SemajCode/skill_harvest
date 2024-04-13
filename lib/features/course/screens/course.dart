import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/core/util/constants/enums.dart';
import 'package:skillharvest/features/course/providers/course_provider.dart';
import 'package:skillharvest/features/course/screens/selected_course.dart';
import 'package:skillharvest/features/course/widgets/choose_course.dart';
import 'package:skillharvest/features/course/widgets/course_category.dart';
import 'package:skillharvest/features/course/widgets/course_item.dart';
import 'package:skillharvest/features/course/widgets/search_text_field.dart';
// import 'package:skillharvest/core/util/constants/enums.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
              children: [
                CourseCategory(
                  categoryImage: AppImage.languageIllus,
                  categoryText: CategoryConst.coding.name,
                  color: Pallete.blueColor,
                ),
                const Gap(16),
                CourseCategory(
                  categoryImage: AppImage.paintIllus,
                  categoryText: CategoryConst.design.name,
                  color: Pallete.purpleColor,
                ),
              ],
            ),
          ),
          const ChooseCourse(),
          Consumer(
            builder: (context, ref, child) {
              final courseList = ref.watch(courseProvider);

              return SizedBox(
                  height: 325,
                  child: ListView.builder(
                    itemCount: courseList.length,
                    itemBuilder: (context, index) {
                      final course = courseList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SelectedCourse(
                                isUserCourse: false,
                                courseIndex: index,
                              ),
                            ),
                          );
                        },
                        child: CourseItem(
                          courseIndex: index,
                          courseTitle: course.title,
                          courseValue: course.price,
                          facilitator: course.instructor,
                          duration: course.duration,
                        ),
                      );
                    },
                  ));
            },
          )
        ],
      ),
    );
  }
}

// ListView(
//                   children: [
                    // InkWell(
                      // onTap: () {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (context) => const SelectedCourse(),
                      //     ),
                      //   );
                      // },
                      // child: const CourseItem(
                      //   courseTitle: 'Product Design v1.0',
                      //   courseValue: '190',
                      //   facilitator: 'Robertson Connie',
                      //   totalHours: '14',
                      // ),
//                     ),
//                     const CourseItem(
//                       courseTitle: 'Java Development',
//                       courseValue: '200',
//                       facilitator: 'Nguyen Shane',
//                       totalHours: '18',
//                     ),
//                     const CourseItem(
//                       courseTitle: 'Visual Design',
//                       courseValue: '250',
//                       facilitator: 'Bert Pullman',
//                       totalHours: '16',
//                     ),
//                   ],
//                 ),
//               );