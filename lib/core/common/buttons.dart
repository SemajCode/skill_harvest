import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 54),
        backgroundColor: Pallete.blueColor,
        foregroundColor: Pallete.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: const Text(
        'Create account',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
