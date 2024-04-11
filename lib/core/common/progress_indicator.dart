import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

class UserProgressIndicator extends StatelessWidget {
  const UserProgressIndicator({
    super.key,
    required this.value,
    required this.color,
  });

  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth * value;
        return Stack(
          children: [
            Container(
              height: 6,
              color: Pallete.dAccentColor.withOpacity(0.3),
            ),
            Container(
              width: width,
              height: 6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Pallete.whiteColor.withOpacity(0.1),
                    color,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CourseProgressIndicator extends StatelessWidget {
  const CourseProgressIndicator({
    super.key,
    required this.value,
    required this.color,
  });

  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth * value;
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Container(
                height: 6,
                color: Pallete.whiteColor,
              ),
              Container(
                width: width,
                height: 6,
                color: color,
              ),
            ],
          ),
        );
      },
    );
  }
}
