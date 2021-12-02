import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:nzakiapplication/config.dart';
import 'package:nzakiapplication/widgets/app_bar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: defaultAppBar(
          label: 'contactUs'.tr
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: backgroundDecoration,
          child: SingleChildScrollView(
            child: Card(
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h6('contactUs'.tr),
                    const Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading:Icon(Icons.phone,color: Get.theme.primaryColor,),
                          title: const Text('0663244100'),
                        ),
                        ListTile(
                          leading:Icon(Icons.mail,color: Get.theme.primaryColor,),
                          title: const Text('amouraammarabderafik@gmail.com'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
