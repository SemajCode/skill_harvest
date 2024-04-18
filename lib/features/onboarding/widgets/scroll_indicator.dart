import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 28 : 9,
      height: 5,
      decoration: BoxDecoration(
        color: isActive ? Pallete.blueColor : Pallete.dAccentColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    );
  }
}
