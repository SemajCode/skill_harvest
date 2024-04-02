import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text('Forgot Password?',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14,
                color: Pallete.blackColor,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}
