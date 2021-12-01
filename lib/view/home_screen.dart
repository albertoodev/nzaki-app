import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/drawer.dart';
import '../test.dart';
import '../view/calculation_screen.dart';
import '../view/settings_screen.dart';
import '../config.dart';

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
              onPressed: () => Get.to(
                const SettingsScreen(),
              ),
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: Config.backgroundDecoration,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...list.map(
                  (element) => Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(
                            color: Get.theme.primaryColor,
                          ),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          onTap: () => Get.to(
                            () => const CalculationScreen(),
                          ),
                          visualDensity: VisualDensity.standard,
                          leading: Icon(
                            Icons.home,
                            color: Get.theme.primaryColor,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Get.theme.primaryColor,
                          ),
                          title: Text(element),
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
        drawer: defaultDrawer(),
      ),
    );
  }
}
