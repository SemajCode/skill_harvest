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
