import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/data/zakat_icons.dart';
import '/widgets/widgets.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: DefaultAppBar(
          label: 'contactUs'.tr
        ),
        body: BackgroundContainer(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Card(
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading:Icon(ZakatIcons.facebook,color: Get.theme.primaryColor,),
                          title: const Text('Alber To'),
                        ),
                        ListTile(
                          leading:Icon(Icons.mail,color: Get.theme.primaryColor,),
                          title: const Text('amoura.abderafik@univ-setif.dz'),
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
