import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      height: 96,
      decoration: BoxDecoration(
          color: Pallete.offWhiteColor,
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: Pallete.greyText,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const Gap(40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product Design v1.0',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.supervised_user_circle_sharp,
                    color: Pallete.greyText,
                    size: 12,
                  ),
                  Gap(4),
                  Text(
                    'Bert Pullman',
                    style: TextStyle(fontSize: 12, color: Pallete.greyText),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    '\$190',
                    style: TextStyle(
                      color: Pallete.blueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(6),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Pallete.onPurpleBackground,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      '14 hours',
                      style: TextStyle(
                        color: Pallete.orangeColor,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
