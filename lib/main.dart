import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'utils/bindings/global_binding.dart';
import 'controller/settings_controller.dart';
import 'view/splash_screen.dart';
import 'themes/themes.dart';
import 'utils/languages/translation.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: SettingsController().getLocale(),
      themeMode:SettingsController().getThemeMode(),
      theme:lightTheme,
      darkTheme:darkTheme,
      translations: Translation(),
      fallbackLocale: const Locale('en'),
      initialBinding: GlobalBinding(),
      home:const SplashScreen(),
    );
  }
}
