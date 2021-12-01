import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //locale: Locale('ar'),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: const Color(0xff1c2541),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff1c2541),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
            size: 35,
          )
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1c2541),
        ),
      ),
      darkTheme: ThemeData(
        backgroundColor: const Color(0xff1c2541),
        primaryColor: const Color(0xff1c2541),
        scaffoldBackgroundColor: const Color(0xff1c2541),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0b132b),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xff0b132b),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(
              size: 40,
            )
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
