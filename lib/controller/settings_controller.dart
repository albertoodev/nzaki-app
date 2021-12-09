import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/utils/data/global_data.dart';

class SettingsController extends GetxController {
  bool isOnBoarding = false;
  final GetStorage _getStorage = GetStorage();

  //Rx variables
  RxInt currentTheme = 2.obs;
  RxString language = 'en'.obs;

  //keys variables
  final String themeKey = 'theme';
  final String languageKey = 'language';
  final String isOnBoardingKey='onBoarding';
  //constrictor
  SettingsController() {
    currentTheme.value = _getStorage.read(themeKey) ?? 2;
    language.value = _getStorage.read(languageKey) ?? 'en';
    isOnBoarding = _getStorage.read(isOnBoardingKey) ?? false;
  }

  //theme mode functions
  ThemeMode getThemeMode() => themes[_getThemeValue()]['value'];

  int _getThemeValue() {
    return _getStorage.read(themeKey) ?? 2;
  }

  changeCurrentTheme(int value, ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    currentTheme.value = value;
    _getStorage.write(themeKey, value);
  }

  //language functions

  Locale getLocale() => Locale(_getLanguageValue());

  String _getLanguageValue() => _getStorage.read(languageKey) ?? 'ar';

  changeLanguage({
    required String value,
  }) {
    language.value = value;
    Get.updateLocale(Locale(value));
    _getStorage.write(languageKey, value);
  }
  onBoardingDone(){
    isOnBoarding=true;
    _getStorage.write(isOnBoardingKey,isOnBoarding);
  }
  changeLanguageFromOnBoarding() {
    language.value = language.value == 'en' ? 'ar' : 'en';
    Get.updateLocale(Locale(language.value));
    _getStorage.write(languageKey, language.value);
  }
}
