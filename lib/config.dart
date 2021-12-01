import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Config{
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

