import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/data/global_data.dart';
import '../view/about.dart';
import '../view/contact_us.dart';
import '../view/settings_screen.dart';
import '../widgets/widgets.dart';
import '../view/calculation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/logo.png',
            height: AppBar().preferredSize.height - 10,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Get.to(() => About(
                    title: 'aboutDrawer',
                    content: 'aboutZakat',
                  )),
              icon: const Icon(
                Icons.info,
              ),
            ),
          ],
        ),
        body: backgroundContainer(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...zakatTypes.map(
                  (element) => Column(
                    children: [
                      Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          onTap: () => Get.to(
                            () => CalculationScreen(
                              id: element.id,
                            ),
                          ),
                          visualDensity: VisualDensity.standard,
                          leading: Icon(
                            element.icon,
                            color: Get.theme.primaryColor,
                            size: (element.id == 1) ? 28 : 23,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Get.theme.primaryColor,
                          ),
                          title: Text(
                            element.name.tr,
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Get.theme.primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            height: double.infinity,
            width: Get.width,
            color: Get.theme.primaryColor,
            child: ListView(
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
                ...drawerItem('settings'.tr, Icons.settings,
                    () => Get.to(() => const SettingsScreen())),
                ...drawerItem(
                    'aboutDrawer'.tr,
                    Icons.info,
                    () => Get.to(() => About(
                          title: 'aboutDrawer',
                          content: 'aboutZakat',
                        ))),
                ...drawerItem(
                    'ayatDrawer'.tr,
                    Icons.menu_book,
                    () => Get.to(() => About(
                          title: 'ayatDrawer',
                          content: ayatText,
                          isArabic: true,
                        ))),
                ...drawerItem(
                  'rate'.tr,
                  Icons.star,
                  () => Get.defaultDialog(
                    title: 'Soon',
                    middleText: 'coming soon ...',
                  ),
                ),
                ...drawerItem('contactUs'.tr, Icons.phone,
                    () => Get.to(() => const ContactUs())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
