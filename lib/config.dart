import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List themes = [
  {
    'index': 0,
    'value': ThemeMode.light,
    'label': 'light mode',
  },
  {
    'index': 1,
    'value': ThemeMode.dark,
    'label': 'dark mode',
  },
  {
    'index': 2,
    'value': ThemeMode.system,
    'label': 'system mode',
  }
];

const List languages = [
  {
    'value': 'en',
    'label': 'English',
  },
  {
    'value': 'fr',
    'label': 'Français',
  },
  {
    'value': 'ar',
    'label': 'عربي',
  }
];

class Config {
  static BoxDecoration backgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        (Get.isDarkMode)
            ? 'assets/images/darkBackgroundHome.png'
            : 'assets/images/lightBackground.png',
      ),
      fit: BoxFit.cover,
    ),
  );
}
