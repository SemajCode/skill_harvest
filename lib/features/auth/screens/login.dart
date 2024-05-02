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
import 'package:skillharvest/features/home/screens/home.dart';

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

  Future<void> _submit() async {
    final emailValidator = Validator.validateEmail(emailController.text);
    final passValidator = Validator.validatePassword(passwordController.text);
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      showSnackBar(context, 'PLEASE FILL IN ALL FIELDS');
    }
    if (emailValidator == null && passValidator == null) {
      await ref.read(loginProvider).emailLogin(
            passwordController.text,
            emailController.text,
            context,
          );

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }
  }

  Future<void> googleSignIn() async {
    await ref.read(loginProvider).googleLogin(context);
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
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(20),
                LoginTextField(
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
                isBusy
                    ? const CircularProgressIndicator(
                        color: Pallete.blueColor,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImage.facebookSvg),
                          const Gap(30),
                          GestureDetector(
                            onTap: googleSignIn,
                            child: SvgPicture.asset(AppImage.googleSvg),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
