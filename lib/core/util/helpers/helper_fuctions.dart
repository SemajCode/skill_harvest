import 'dart:math';

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

Color randomColor() {
  List<Color> color = [
    Pallete.blueColor,
    Pallete.orangeColor,
    Pallete.purpleColor,
    Colors.red,
  ];

  Random random = Random();
  int randomColorIndex = random.nextInt(color.length);
  return color[randomColorIndex];
}

String truncateText(String text, int maxLength, maxWordLenth) {
  List<String> words = text.split(RegExp(r'\s+'));
  words.removeWhere((word) => word.isEmpty);

  if (text.length <= maxLength || words.length <= maxWordLenth) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}
