import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nzakiapplication/view/about.dart';
import 'package:nzakiapplication/view/ayat.dart';
import 'package:nzakiapplication/view/contact_us.dart';
import 'package:nzakiapplication/view/settings_screen.dart';

defaultDrawerItem(String text,IconData icon,VoidCallback onTap)=>[
  ListTile(
    onTap: onTap,
    leading:  Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
fontSize: 15,
fontWeight: FontWeight.bold,
    ),
  ),
  ),
   const SizedBox(
    height: 15,
  )
];

defaultDrawer() => Drawer(
      child: Container(
        height: double.infinity,
        width: Get.height,
        color: Get.theme.primaryColor,
        child:
           ListView(
               children: [
                 Image.asset(
                   'assets/images/logo.png',
                   height: AppBar().preferredSize.height - 10,
                 ),
                 const Divider(
                   color: Colors.white,
                 ),
                 const SizedBox(
                   height: 30 ,
                 ),
                 ...defaultDrawerItem('settings'.tr, Icons.settings,()=>Get.to(()=>SettingsScreen())),
                 ...defaultDrawerItem('aboutDrawer'.tr, Icons.info,()=>Get.to(()=>const About())),
                 ...defaultDrawerItem('ayatDrawer'.tr, FontAwesomeIcons.quran,()=>Get.to(()=>const AyatScreen())),
                 ...defaultDrawerItem('rate'.tr, Icons.star,()=>Get.defaultDialog()),
                 ...defaultDrawerItem('contactUs'.tr, Icons.phone,()=>Get.to(()=>const ContactUs())),
               ],
             ),
      ),
    );
