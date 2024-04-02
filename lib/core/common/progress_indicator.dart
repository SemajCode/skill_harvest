import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/helper.dart';

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
    final double width = pageWidth(context) * value;
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
  }
}
