import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/settings_controller.dart';

import '../config.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  h6(String text) => Text(
        text,
        style: Get.theme.textTheme.headline6,
      );

  @override
  Widget build(BuildContext context) {
    SettingsController globalController = Get.put(
      SettingsController(),
      permanent: true,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SETTINGS'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          decoration: Config.backgroundDecoration,
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: Get.theme.primaryColor,
                  width: 0.5,
                ),
              ),
              color: Colors.white.withOpacity(0.9),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h6('LANGUAGE'),
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
                    h6('THEME MODE'),
                    const Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        ...themes.map(
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
