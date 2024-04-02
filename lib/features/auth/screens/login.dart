import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/core/constants/constant.dart';
import 'package:skillharvest/features/auth/screens/signup.dart';
import 'package:skillharvest/features/auth/widget/bottom_action.dart';
import 'package:skillharvest/features/auth/widget/enter_details_text.dart';
import 'package:skillharvest/features/auth/widget/forgot_password.dart';
import 'package:skillharvest/features/auth/widget/or_login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        leadingWidth: double.infinity,
        leading: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Log in',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(5),
              EnterDetailsText(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(20),
            const AppTextField(
              hint: 'Enter your Email',
              label: 'Email',
            ),
            const Gap(30),
            const PasswordTextField(
              hint: 'Enter your Password',
              label: 'Password',
            ),
            const Gap(10),
            const ForgotPassword(),
            const Gap(30),
            PrimaryButton(text: 'Login', onTap: () {}),
            const Gap(30),
            BottomAction(
              title: "I Don’t have an account? ",
              option: 'Sign up?',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Signup(),
                  ),
                );
              },
            ),
            const Gap(30),
            const OrLoginWith(),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImage.facebookSvg),
                const Gap(30),
                SvgPicture.asset(AppImage.googleSvg),
              ],
            )
          ],
        ),
      ),
    );
  }
}
