import 'package:flutter/material.dart';

class Pallete {
  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const offWhiteColor = Color.fromRGBO(240, 240, 242, 1);
  static const blackColor = Color.fromRGBO(1, 1, 1, 1);
  static const blueColor = Color.fromRGBO(61, 92, 255, 1);
  static const greyText = Colors.grey;
  static const lAccentColor = Color.fromARGB(255, 87, 87, 87);
  static const dAccentColor = Color.fromARGB(255, 147, 147, 148);
  static const dSecondaryBackgroundColor = Color.fromARGB(255, 37, 37, 37);

  static var lightThemeMode = ThemeData.light().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: whiteColor,
    primaryColor: blueColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: offWhiteColor,
      foregroundColor: blackColor,
      elevation: 0,
    ),
  );
  static var darkThemeMode = ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: blackColor,
    primaryColor: blueColor,
  );
}
