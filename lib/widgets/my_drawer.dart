import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/widgets/widgets.dart';

import '../utils/data/global_data.dart';
import '../view/about.dart';
import '../view/contact_us.dart';
import '../view/settings_screen.dart';

class MyDrawer extends Drawer {
  MyDrawer({Key? key})
      : super(
          key: key,
          child: Container(
            height: double.infinity,
            width: Get.width,
            color: Get.theme.primaryColor,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: AppBar().preferredSize.height - 10,
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    text: 'settings'.tr,
                    icon: Icons.settings,
                    onTap: () => Get.to(
                           SettingsScreen(),
                          transition: Transition.topLevel,
                        )),
                DrawerItem(
                    text: 'ayatDrawer'.tr,
                    icon: Icons.menu_book,
                    onTap: () => Get.to(
                          const About(
                            title: 'ayatDrawer',
                            content: ayatText,
                            isArabic: true,
                          ),
                          transition: Transition.topLevel,
                        )),
                DrawerItem(
                    text: 'aboutDrawer'.tr,
                    icon: Icons.info,
                    onTap: () => Get.to(
                          const About(
                            title: 'aboutDrawer',
                            content: 'aboutZakat',
                          ),
                          transition: Transition.topLevel,
                        )),
                DrawerItem(
                  text: 'rate'.tr,
                  icon: Icons.star,
                  onTap: () => Get.defaultDialog(
                    title: 'rate'.tr,
                    middleText: 'coming'.tr,
                  ),
                ),
                DrawerItem(
                    text: 'contactUs'.tr,
                    icon: Icons.phone,
                    onTap: () => Get.to(
                          const ContactUs(),
                          transition: Transition.topLevel,
                        )),
              ],
            ),
          ),
        );
}
