import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_bar.dart';
import '../config.dart';
import '../controller/settings_controller.dart';


class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SettingsController globalController = Get.put(
      SettingsController(),
    );

    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(
 label:'settings'.tr
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundDecoration,
          child: SingleChildScrollView(
            child: Card(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h6('language'.tr),
                    const Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        ...languages.map(
                          (languageItem) => ListTile(
                            leading: GetX<SettingsController>(
                              builder: (controller) => Radio<String>(
                                activeColor: Get.theme.primaryColor,
                                value: languageItem['value'],
                                groupValue: controller.language.value,
                                onChanged: (value) {
                                  globalController.changeLanguage(value!);
                                },
                              ),
                            ),
                            onTap: () {
                              globalController
                                  .changeLanguage(languageItem['value']);
                            },
                            title: Text(languageItem['label']),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    h6('themeMode'.tr),
                    const Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        ...Config().themes.map(
                          (theme) => ListTile(
                            leading: GetX<SettingsController>(
                              builder: (controller) => Radio<int>(
                                activeColor: Get.theme.primaryColor,
                                value: theme['index'],
                                groupValue: controller.currentTheme.value,
                                onChanged: (value) {
                                  globalController.changeCurrentTheme(
                                      value!, theme['value']);
                                },
                              ),
                            ),
                            onTap: () {
                              globalController.changeCurrentTheme(
                                  theme['index'], theme['value']);
                            },
                            title: Text(theme['label']),
                          ),
                        ),
                      ],
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
}
