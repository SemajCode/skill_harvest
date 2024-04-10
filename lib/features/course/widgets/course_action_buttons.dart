import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';

class CourseActionButtons extends StatelessWidget {
  const CourseActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
