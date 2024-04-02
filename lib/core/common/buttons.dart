import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 44),
        backgroundColor: Pallete.blueColor,
        foregroundColor: Pallete.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
