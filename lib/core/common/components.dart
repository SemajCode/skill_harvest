import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

class BottomAction extends StatelessWidget {
  final String title;
  final String option;
  final VoidCallback? onPressed;

  const BottomAction({
    super.key,
    required this.title,
    required this.option,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        children: [
          TextSpan(
            text: option,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onPressed?.call();
              },
            style: const TextStyle(color: Pallete.blueColor),
          )
        ],
      ),
    );
  }
}

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
