import 'package:flutter/material.dart';

class Pallete {
  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const offWhiteColor = Color.fromRGBO(240, 240, 242, 1);
  static const blackColor = Color.fromRGBO(1, 1, 1, 1);
  static const blueColor = Color.fromRGBO(61, 92, 255, 1);
  static const greyText = Colors.grey;

  // 133,133,151

  static var lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: blueColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      foregroundColor: blackColor,
      elevation: 0,
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: blueColor,
    //     foregroundColor: whiteColor,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(14),
    //     ),
    //   ),
    // ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     backgroundColor: whiteColor,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(14),
    //       side: const BorderSide(
    //         color: blueColor,
    //       ),
    //     ),
    //   ),
    // ),
  );
}
