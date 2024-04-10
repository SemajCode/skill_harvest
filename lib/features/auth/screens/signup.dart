import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/signup_checkbox.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/features/auth/screens/login.dart';
import 'package:skillharvest/features/auth/screens/phone_login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController textController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void createAccount() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PhoneLogin(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
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
            AppTextField(
              textController: textController,
              hint: 'Enter your Email',
              label: 'Email',
            ),
            const Gap(20),
            PasswordTextField(
              passwordController: passwordController,
              hint: 'Enter your Password',
              label: 'Password',
            ),
            const Gap(20),
            PrimaryButton(
              text: 'Create account',
              onTap: createAccount,
            ),
            const Gap(20),
            const Row(
              children: [
                SignUpCheckBox(),
                Text(
                  'By creating an account you have to\n agree with our terms & conditions.',
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
                              builder: (context) => const Login(),
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
