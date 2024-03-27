import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Enter your Email',
          label: const Text(
            'Email',
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Pallete.greyText[350]!),
              borderRadius: BorderRadius.circular(15)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Pallete.greyText),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Pallete.greyText),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      // style: const TextStyle(color: Colors.black),
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
          hintText: 'Enter your Password',
          label: const Text(
            'Password',
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Pallete.greyText[350]!),
              borderRadius: BorderRadius.circular(15)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Pallete.greyText),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Pallete.greyText),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
