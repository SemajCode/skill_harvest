import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helper.dart';

class CourseCategory extends StatelessWidget {
  const CourseCategory({
    super.key,
    required this.categoryImage,
    required this.categoryText,
    required this.color,
  });

  final String categoryImage;
  final String categoryText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      width: pageWidth(context) * 0.44,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 78,
            decoration: BoxDecoration(
              color: color.withOpacity(0.28),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
            left: 0,
            child: SvgPicture.asset(
              categoryImage,
              height: 86,
            ),
          ),
          Positioned(
            bottom: 8.9,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: const BoxDecoration(
                color: Pallete.offWhiteColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Text(
                categoryText,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
