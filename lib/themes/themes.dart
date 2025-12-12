import 'package:flutter/material.dart';


final ThemeData lightTheme = ThemeData(
  fontFamily: 'ElMessiri',
  cardTheme: CardThemeData(
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
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff1c2541)),
);
final ThemeData darkTheme = ThemeData (
  fontFamily: 'ElMessiri',
  cardTheme: CardThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
      side: const BorderSide(
        color: Color(0xff0b132b),
      ),
    ),
    color: Colors.white.withOpacity(0.8),
  ),
  primaryColor: const Color(0xff1c2541),
  scaffoldBackgroundColor: const Color(0xff1c2541),
  appBarTheme:  AppBarTheme(
    backgroundColor: Color(0xff0b132b),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: Colors.white.withOpacity(0.8))
      .copyWith(background: const Color(0xff1c2541)),
);
