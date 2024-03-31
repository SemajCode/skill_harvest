import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            color: Pallete.greyText,
          ),
        ),
        Gap(15),
        Text('Or login with'),
        Gap(15),
        Expanded(
          child: Divider(
            color: Pallete.greyText,
          ),
        ),
      ],
    );
  }
}
