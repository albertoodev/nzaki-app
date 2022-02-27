import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'view/start_screen.dart';
import 'utils/bindings/global_binding.dart';
import 'controller/settings_controller.dart';
import 'themes/themes.dart';
import 'utils/languages/translation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nzaki',
      locale: SettingsController.getLocale(),
      themeMode:SettingsController.getThemeMode(),
      theme:lightTheme,
      darkTheme:darkTheme,
      translations: Translation(),
      fallbackLocale: const Locale('en'),
      initialBinding: GlobalBinding(),
      home:const StartScreen(),
    );
  }
}
