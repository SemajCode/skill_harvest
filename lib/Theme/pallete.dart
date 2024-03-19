import 'package:flutter/material.dart';

class Pallete {
  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const blueColor = Color.fromRGBO(61, 92, 255, 1);

  static var lightThemeMode = ThemeData.light().copyWith(
    backgroundColor: whiteColor,
  );
}
