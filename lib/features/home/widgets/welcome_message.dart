import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/constants/constant.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.blueColor,
      height: 118,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, James',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Let\'s start learning',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              AppImage.avatarSvg,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
