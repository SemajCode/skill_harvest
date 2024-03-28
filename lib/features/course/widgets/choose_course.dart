// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';

class ChooseCourse extends StatelessWidget {
  const ChooseCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose your course',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(12),
          Row(
            children: [
              CourseFilterChip(
                text: 'All',
                isSelect: true,
              ),
              CourseFilterChip(
                text: 'Popular',
                isSelect: false,
              ),
              CourseFilterChip(
                text: 'New',
                isSelect: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseFilterChip extends StatelessWidget {
  const CourseFilterChip({
    super.key,
    required this.text,
    required this.isSelect,
  });

  final String text;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: FilterChip(
        backgroundColor: Pallete.offWhiteColor,
        side: BorderSide(
          style: BorderStyle.none,
        ),
        showCheckmark: false,
        label: Text(text),
        onSelected: (value) {},
        selected: isSelect,
        selectedColor: Pallete.blueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        labelStyle: TextStyle(
          color: isSelect ? Pallete.whiteColor : Pallete.blackColor,
        ),
      ),
    );
  }
}
