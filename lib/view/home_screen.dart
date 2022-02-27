import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/models/zakat_type.dart';
import '/widgets/my_drawer.dart';
import '/utils/data/global_data.dart';
import '/view/about.dart';
import '/widgets/widgets.dart';
import '/view/calculation_screen.dart';

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
                const About(
                  title: 'aboutDrawer',
                  content: 'aboutZakat',
                ),
                transition: Transition.topLevel,
              ),
              icon: const Icon(
                Icons.info,
              ),
            ),
          ],
        ),
        body: BackgroundContainer(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: zakatTypes.map(
                _zakatTypeElement,
                ).toList(),
            ),
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }

    /// get [Card] of zakat type element
    Widget _zakatTypeElement (ZakatType element) =>Card(
      margin: const EdgeInsets.all(4.0)
          .add(const EdgeInsets.only(bottom: 30.0)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onTap: () => Get.to(
          CalculationScreen(
            id: element.id,
          ),
          transition: Transition.rightToLeftWithFade,
          curve: Curves.easeInOutQuint,
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
          'name${element.id}'.tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              color: Get.theme.primaryColor),
        ),
      ),
    );
}
