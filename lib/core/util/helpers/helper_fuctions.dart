import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';

double pageHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double pageWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double calcProgress(int covered, int total) {
  return (covered / total);
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Pallete.blueColor,
      content: Text(message),
    ),
  );
}
