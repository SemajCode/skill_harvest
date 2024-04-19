import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/auth/controllers/signup_controller.dart';

class SignUpCheckBox extends ConsumerStatefulWidget {
  const SignUpCheckBox({
    super.key,
  });

  @override
  ConsumerState<SignUpCheckBox> createState() => _SignUpCheckBoxState();
}

class _SignUpCheckBoxState extends ConsumerState<SignUpCheckBox> {
  @override
  Widget build(BuildContext context) {
    bool toggle = ref.watch(signUpProvider).acceptTerms;
    return Checkbox(
      value: toggle,
      onChanged: (value) {
        setState(() {
          ref.watch(signUpProvider).acceptT();
        });
      },
      checkColor: Pallete.whiteColor,
      activeColor: Pallete.blueColor,
    );
  }
}
