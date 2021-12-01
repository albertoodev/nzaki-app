import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config.dart';

class CalculationScreen extends StatelessWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITEM 1'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info,
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: Config.backgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Get.theme.primaryColor,
                    width: 0.5,
                  ),
                ),
                color: Colors.white.withOpacity(0.9),
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ListTile(
                        leading: Text('nisab:'),
                        title: Text(
                          '000.0',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const ListTile(
                        leading: Text('value:'),
                        title: TextField(
                          textAlign: TextAlign.center,
                          decoration:
                              InputDecoration(hintText: 'ENTER UR VALUE'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        label: const Text('check'),
                        backgroundColor: Get.theme.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Get.theme.primaryColor,
                    width: 0.5,
                  ),
                ),
                color: Colors.white.withOpacity(0.9),
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    '0.0',
                    style: Get.theme.textTheme.headline5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
