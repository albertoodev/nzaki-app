import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/data/global_data.dart';
import '/widgets/widgets.dart';
import '/controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final SettingsController _globalController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppBar(label: 'settings'.tr),
        body: BackgroundContainer(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Card(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'language'.tr,
                      style: Get.theme.textTheme.titleLarge,
                    ),
                    const Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    Column(
                      children: languages.map(_getLanguageItem).toList(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'themeMode'.tr,
                      style: Get.theme.textTheme.titleLarge,
                    ),
                    const Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    Column(
                      children: themes
                          .map(
                            _getThemeItem,
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// get [ListTile] of language item
  Widget _getLanguageItem(languageItem) => GetX<SettingsController>(
        builder: (controller) => RadioListTile<String>(
          value: languageItem['value'],
          groupValue: controller.language.value,
          onChanged: (value) => _globalController.changeLanguage(value: value!),
          activeColor: Get.theme.primaryColor,
          title: Text(languageItem['label']),
        ),
      );

  /// get [ListTile] of theme item
  Widget _getThemeItem(theme) => GetX<SettingsController>(
        builder: (controller) => RadioListTile<int>(
          value: theme['index'],
          groupValue: controller.currentTheme.value,
          onChanged: (value) =>
              _globalController.changeCurrentTheme(value!, theme['value']),
          activeColor: Get.theme.primaryColor,
          title: Text('${theme['label']}'.tr),
        ),
      );
}
