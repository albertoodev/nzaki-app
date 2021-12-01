import 'package:flutter/material.dart';

class Themes {
  final lightTheme =ThemeData.light().copyWith(
    primaryColor: const Color(0xff1c2541),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1c2541),
    ),
  );
  final darkTheme=ThemeData.light().copyWith(
    backgroundColor: const Color(0xff1c2541),
    primaryColor: const Color(0xff1c2541),
    scaffoldBackgroundColor: const Color(0xff1c2541),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff0b132b),
    ),
  );
}