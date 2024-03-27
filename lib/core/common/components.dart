import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';

class OrLoginWidget extends StatelessWidget {
  const OrLoginWidget({
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

class BottomActionWidget extends StatelessWidget {
  final String title;
  final String option;
  final VoidCallback? onPressed;

  const BottomActionWidget({
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

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: const MaterialStatePropertyAll(Pallete.blueColor),
            fixedSize: MaterialStatePropertyAll(
                Size(MediaQuery.of(context).size.width, 50))),
        child: const Text('Log in',
            style: TextStyle(
                fontSize: 16,
                color: Pallete.whiteColor,
                fontWeight: FontWeight.w600)));
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
