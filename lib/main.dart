import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controller/settings_controller.dart';
import '../view/splash_screen.dart';
import 'themes/themes.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: SettingsController().getLocale(),
      themeMode:SettingsController().getThemeMode(),
      theme:Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: const SplashScreen(),
    );
  }
}
