import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nzakiapplication/view/start_screen.dart';
import '/utils/data/global_data.dart';

class SettingsController extends GetxController {
  static final GetStorage _getStorage = GetStorage();

  //Rx variables
  late RxInt currentTheme;
  late RxString language;

  //keys variables
  static const String _themeKey = 'theme';
  static const String _languageKey = 'language';
  static const String _isOnBoardingKey = 'boarding';

  //constrictor
  SettingsController() {
    currentTheme = RxInt(_getStorage.read(_themeKey) ?? 2);
    language = RxString(_getStorage.read(_languageKey) ?? 'ar');
    isOnBoarding = _getStorage.read(_isOnBoardingKey) ?? false;
  }

  //theme mode functions
  /// get initial [ThemeMode] from local storage [GetStorage]
  static ThemeMode getThemeMode() => themes[_getThemeValue()]['value'];

  /// get [ThemeMode] value from local storage [GetStorage]
  static int _getThemeValue() {
    return _getStorage.read(_themeKey) ?? 2;
  }

  /// change [currentTheme] and write it in the local storage [GetStorage]
  changeCurrentTheme(int value, ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    currentTheme.value = value;
    _getStorage.write(_themeKey, value);
  }

  //language functions
  /// get initial [Locale] from local storage
  static Locale getLocale() => Locale(_getLanguageValue());

  /// get [Locale] value from local storage [GetStorage]
  static String _getLanguageValue() => _getStorage.read(_languageKey) ?? 'ar';

  /// change [language] and write it in the local storage [GetStorage]
  changeLanguage({required String value}) {
    language.value = value;
    Get.updateLocale(Locale(value));
    _getStorage.write(_languageKey, value);
  }

  /// change [language] from [StartScreen] and write it in the local storage [GetStorage]
  changeLanguageFromOnBoarding() {
    language.value = language.value == 'en' ? 'ar' : 'en';
    Get.updateLocale(Locale(language.value));
    _getStorage.write(_languageKey, language.value);
  }

  // onBoarding [StartScreen]
  late bool isOnBoarding;
  /// set [isOnBoarding] value to [true] and write it in the local storage [GetStorage]
  onBoardingDone() {
    isOnBoarding = true;
    _getStorage.write(_isOnBoardingKey, isOnBoarding);
  }
}
