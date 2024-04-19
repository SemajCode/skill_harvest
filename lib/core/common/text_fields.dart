import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/validators/validator.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.textController,
  });
  final String label;
  final String hint;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(
          label,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Pallete.greyText[350]!),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Pallete.blueColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Pallete.greyText),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.textController,
  });
  final String label;
  final String hint;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return Validator.validateEmail(value);
      },
      controller: textController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(
          label,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Pallete.greyText[350]!),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Pallete.blueColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Pallete.greyText),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.passwordController,
  });
  final String label;
  final String hint;
  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool toggled = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return Validator.validatePassword(value);
      },
      controller: widget.passwordController,
      keyboardType: TextInputType.number,
      obscureText: toggled,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: toggled
              ? const Icon(
                  Icons.visibility_off,
                  // color: Colors.black,
                )
              : const Icon(
                  Icons.visibility,
                  // color: Colors.black,
                ),
          onPressed: () {
            setState(() {
              toggled = !toggled;
            });
          },
        ),
        hintText: widget.hint,
        label: Text(
          widget.label,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Pallete.greyText[350]!),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Pallete.blueColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Pallete.greyText),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
