import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/constants/constant.dart';
import 'package:skillharvest/core/util/helper.dart';
import 'package:skillharvest/features/course/widgets/course_video.dart';

class SelectedCourse extends StatelessWidget {
  const SelectedCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.palePink,
      body: Stack(
        children: [
          //Up
          Positioned(
            top: 0,
            child: SizedBox(
              child: Stack(
                children: [
                  //column
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        const Icon(
                          Icons.visibility_off,
                          size: 20,
                        ),
                        const Gap(8),
                        ClipPath(
                          clipper: const ShapeBorderClipper(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(14),
                                topRight: Radius.circular(14),
                              ),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(8, 4, 16, 4),
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4),
                              ),
                            ),
                            child: const Text('BESTSELLER'),
                          ),
                        ),
                        const Gap(18),
                        const Text(
                          'Product Design v1.0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),

                  //Ilustrat
                  SvgPicture.asset(
                    AppImage.selectedCourse,
                    height: 224,
                  )
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              height: 526,
              width: pageWidth(context),
              decoration: BoxDecoration(
                color: Pallete.whiteColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Design',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Gap(5),
                            Text(
                              '6h 14min · 24 lessons',
                              style: TextStyle(
                                color: Pallete.greyText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$ 74.00',
                          style: TextStyle(
                            color: Pallete.blueColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Gap(18),

                    //text
                    Text(
                      'About this course',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(5),
                    //text
                    Text(
                      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, ',
                      style: TextStyle(
                        color: Pallete.greyText,
                        fontSize: 12,
                      ),
                    ),
                    Gap(16),

                    Center(
                      child: Icon(
                        Icons.visibility_off,
                        size: 14,
                      ),
                    ),
                    Gap(16),

                    CourseVideo(
                      title: 'Welcome to the course',
                      duration: '6:10',
                      isLocked: false,
                      videoId: '01',
                    ),
                    CourseVideo(
                      title: 'Process Overview',
                      duration: '6:10',
                      isLocked: false,
                      videoId: '02',
                    ),
                    CourseVideo(
                      title: 'Discovery',
                      duration: '6:10',
                      isLocked: true,
                      videoId: '03',
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
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
                    onPressed: () {},
                    child: const Icon(
                      Icons.star_border_outlined,
                      color: Pallete.vibrantOrange,
                    ),
                  ),
                  const Gap(12),
                  ElevatedButton(
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
                      'Buy Now',
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
