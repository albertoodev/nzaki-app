import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/data/global_data.dart';
import '../widgets/widgets.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController globalController = Get.find<SettingsController>();
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(label: 'settings'.tr),
        body: backgroundContainer(
          child: SingleChildScrollView(
            child: Card(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'language'.tr,
                      style: Get.theme.textTheme.headline6,
                    ),
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
                    Text(
                      'themeMode'.tr,
                      style: Get.theme.textTheme.headline6,
                    ),
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
                                onChanged: (value) => globalController
                                    .changeCurrentTheme(value!, theme['value']),
                              ),
                            ),
                            onTap: () => globalController.changeCurrentTheme(
                                theme['index'], theme['value']),
                            title: Text('${theme['label']}'.tr),
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
