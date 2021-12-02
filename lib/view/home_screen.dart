import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzakiapplication/view/about.dart';
import '../widgets/drawer.dart';
import '../view/calculation_screen.dart';
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
              onPressed: () => Get.to(()=>const About()),
              icon: const Icon(
                Icons.info,
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: backgroundDecoration,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...Config().zakatTypes.map(
                      (element) => Column(
                        children: [
                          Card(
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              onTap: () => Get.to(
                                () => CalculationScreen(
                                  item: element,
                                ),
                              ),
                              visualDensity: VisualDensity.standard,
                              leading: Icon(
                                element.icon,
                                color: Get.theme.primaryColor,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Get.theme.primaryColor,
                              ),
                              title: Text(
                                element.name,
                                textAlign: TextAlign.center,
                                style: Get.textTheme.headline6,
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
        drawer: defaultDrawer(),
      ),
    );
  }
}
