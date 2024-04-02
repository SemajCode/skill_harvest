import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

class EnterDetailsText extends StatelessWidget {
  const EnterDetailsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Enter your details below to login',
      style: TextStyle(
        fontSize: 14,
        color: Pallete.greyText,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
