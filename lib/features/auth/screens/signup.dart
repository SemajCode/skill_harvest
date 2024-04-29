import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/signup_checkbox.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/core/util/validators/validator.dart';
import 'package:skillharvest/features/account/screens/profile.dart';
import 'package:skillharvest/features/auth/controllers/signup_controller.dart';
import 'package:skillharvest/features/auth/screens/login.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> createAccount(bool acceptTerms) async {
    final emailValidator = Validator.validateEmail(emailController.text);
    final passValidator = Validator.validatePassword(passwordController.text);
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      showSnackBar(context, 'PLEASE FILL IN ALL FIELDS');
    }
    if (emailValidator == null && passValidator == null) {
      if (acceptTerms == false) {
        showSnackBar(context, 'PLEASE AGREE TO TERMS TO PROCEED');
      } else {
        await ref.read(signUpProvider).signUp(
              emailController.text,
              passwordController.text,
              context,
            );

        if (context.mounted) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Profile(
                isNewUser: true,
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isBusy = ref.watch(signUpProvider).isBusy;
    bool acceptTerms = ref.watch(signUpProvider).acceptTerms;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginTextField(
                textController: emailController,
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
              isBusy
                  ? const SizedBox(
                      height: 44,
                      width: 44,
                      child: CircularProgressIndicator(
                        color: Pallete.blueColor,
                      ),
                    )
                  : PrimaryButton(
                      text: 'Create account',
                      onTap: () {
                        createAccount(acceptTerms);
                      },
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
      ),
    );
  }
}
