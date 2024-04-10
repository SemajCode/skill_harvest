import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/features/course/widgets/choose_course.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  double startValue = 20;
  double endValue = 90;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close),
                ),
                const Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Search Filter',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
            const Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(10),
            const Wrap(
              runSpacing: 10,
              children: [
                CourseFilterChip(text: 'Design', isSelect: true),
                CourseFilterChip(text: 'Painting', isSelect: false),
                CourseFilterChip(text: 'Coding', isSelect: false),
                CourseFilterChip(text: 'Music', isSelect: false),
                CourseFilterChip(text: 'Visual Identity', isSelect: false),
                CourseFilterChip(text: 'Mathematics', isSelect: false),
              ],
            ),
            const Gap(16),
            const Text(
              'Price',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            RangeSlider(
              labels: RangeLabels(
                '$startValue',
                '$endValue',
              ),
              activeColor: Pallete.blueColor,
              min: 0.0,
              max: 100.0,
              values: RangeValues(startValue, endValue),
              onChanged: (values) {
                setState(() {
                  startValue = values.start;
                  endValue = values.end;
                });
              },
            ),
            const Gap(16),
            const Text(
              'Duration',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(10),
            const Wrap(
              runSpacing: 10,
              children: [
                CourseFilterChip(text: '3-8 hours', isSelect: true),
                CourseFilterChip(text: '8-14 hours', isSelect: false),
                CourseFilterChip(text: '14-20 hours', isSelect: false),
                CourseFilterChip(text: '20-24 hours', isSelect: false),
                CourseFilterChip(text: '24-28 hours ', isSelect: false),
              ],
            ),
            const Gap(26),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 54),
                    foregroundColor: Pallete.blueColor,
                    backgroundColor: Pallete.whiteColor,
                    side: const BorderSide(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Clear',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(pageWidth(context) * 0.58, 54),
                    backgroundColor: Pallete.blueColor,
                    foregroundColor: Pallete.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Apply Filter ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
