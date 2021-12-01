import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../test.dart';

defaultDrawer() => Drawer(
      child: Container(
        height: double.infinity,
        width: Get.height,
        color: Get.theme.appBarTheme.backgroundColor,
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
                 ...list.map(
                       (element) => Column(
                     children: [
                       ListTile(
                         leading: const Icon(
                           Icons.settings,
                           color: Colors.white,
                         ),
                         title: Text(
                           element,
                           style: const TextStyle(
                             color: Colors.white,
                           ),
                         ),
                       ),
                       SizedBox(
                         height: 15,
                       )
                     ],
                   ),
                 ),
               ],
             ),
      ),
    );
