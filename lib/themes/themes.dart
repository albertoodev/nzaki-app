import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: 'ElMessiri',
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
      side: const BorderSide(
        color: Color(0xff1c2541),
      ),
    ),
    color: Colors.white.withOpacity(0.8),
  ),
  primaryColor: const Color(0xff1c2541),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff1c2541),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff1c2541)),
);
final ThemeData darkTheme = ThemeData(
  fontFamily: 'ElMessiri',
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
      side: const BorderSide(
        color: Color(0xff0b132b),
      ),
    ),
    color: Colors.white.withOpacity(0.8),
  ),
  backgroundColor: const Color(0xff1c2541),
  primaryColor: const Color(0xff1c2541),
  scaffoldBackgroundColor: const Color(0xff1c2541),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff0b132b),
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: Colors.white.withOpacity(0.8)),
);
