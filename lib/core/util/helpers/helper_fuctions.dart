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

Color progressColor(double value) {
  if (value <= 0.3) {
    return Colors.red;
  } else if (value <= 0.6) {
    return Pallete.orangeColor;
  } else if (value <= 0.9) {
    return Pallete.purpleColor;
  } else {
    return Pallete.blueColor;
  }
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

String getlessonProgress(int value1, value2) {
  if (value1 == 0) {
    return 'Not Started';
  } else if ((value2 / value1) != 1) {
    return 'In progress';
  }
  return 'Completed';
}
