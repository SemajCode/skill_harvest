import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/signup_checkbox.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/onboarding.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.offWhiteColor,
        toolbarHeight: 140,
        leadingWidth: double.infinity,
        leading: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Text(
                "Sign Up",
                style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
              Gap(12),
              Text(
                'Enter your details below & free sign up',
                style: TextStyle(
                  color: Pallete.greyText,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const EmailTextField(),
            const Gap(20),
            const PasswordTextField(),
            const Gap(20),
            const SignUpButton(),
            const Gap(20),
            const Row(
              children: [
                SignUpCheckBox(),
                Text(
                  'By creating an account you have to agree \n with our terms & conditions.',
                  style: TextStyle(color: Pallete.greyText),
                ),
              ],
            ),
            const Gap(20),
            RichText(
              text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(color: Pallete.greyText),
                  children: [
                    TextSpan(
                      text: 'Log in',
                      style: const TextStyle(
                        color: Pallete.blueColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Onboarding(),
                            ),
                          );
                        },
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
