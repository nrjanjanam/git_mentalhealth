import 'package:flutter/material.dart';
import 'color_constants.dart';

class AppTheme {
  // static const

  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
    backgroundColor: kBackgroundColor,
    scaffoldBackgroundColor: kBackgroundColor,
    fontFamily: "Zen Kaku Gothic Antique",
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFFFFFFFF)),
      headline2: TextStyle(color: Color(0xFFFFFFFF)),
      headline3: TextStyle(color: Color(0xFFFFFFFF)),
      headline4: TextStyle(color: Color(0xFFFFFFFF)),
      headline5: TextStyle(color: Color(0xFFFFFFFF)),
      headline6: TextStyle(color: Color(0xFFFFFFFF)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: kPrimaryDarkColor,
    fontFamily: 'Zen Kaku Gothic Antique',
    backgroundColor: kBackgroundColor,
    scaffoldBackgroundColor: kBackgroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentDarkColor),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFF000000)),
      headline2: TextStyle(color: Color(0xFFFFFFFF)),
      headline3: TextStyle(color: Color(0xFFFFFFFF)),
      headline4: TextStyle(color: Color(0xFFFFFFFF)),
      headline5: TextStyle(color: Color(0xFFFFFFFF)),
      headline6: TextStyle(color: Color(0xFFFFFFFF)),
    ),
  );
}
