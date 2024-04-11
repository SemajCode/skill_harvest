import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/core/util/validators/validator.dart';
import 'package:skillharvest/features/auth/controllers/login_controller.dart';
import 'package:skillharvest/features/auth/screens/signup.dart';
import 'package:skillharvest/features/auth/widget/bottom_action.dart';
import 'package:skillharvest/features/auth/widget/enter_details_text.dart';
import 'package:skillharvest/features/auth/widget/forgot_password.dart';
import 'package:skillharvest/features/auth/widget/or_login.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final emailValidatorText = Validator.validateEmail(emailController.text);
    final passValidatorText =
        Validator.validatePassword(passwordController.text);
    if (emailValidatorText == null || passValidatorText == null) {
      ref
          .read(loginProvider)
          .login(passwordController.text, emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isBusy = ref.watch(loginProvider).isBusy;
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),
              AppTextField(
                textController: emailController,
                hint: 'Enter your Email',
                label: 'Email',
              ),
              const Gap(30),
              PasswordTextField(
                passwordController: passwordController,
                hint: 'Enter your Password',
                label: 'Password',
              ),
              const Gap(10),
              const ForgotPassword(),
              const Gap(30),
              isBusy
                  ? const SizedBox(
                      height: 44,
                      width: 44,
                      child: CircularProgressIndicator(
                        color: Pallete.blueColor,
                      ),
                    )
                  : PrimaryButton(
                      text: 'Login',
                      onTap: _submit,
                    ),
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
      ),
    );
  }
}
