import 'package:flutter/material.dart';
import 'package:get/get.dart';

defaultAppBar({required String label})=>AppBar(
  title: Text(label,style: Get.textTheme.headline5!.apply(color: Colors.white),),
  centerTitle: true,
);

backgroundContainer({required Widget child,EdgeInsetsGeometry padding=const EdgeInsets.all(15),Alignment alignment=Alignment.center})=>Container(
  padding: padding,
  height: double.infinity,
  width: double.infinity,
  alignment:alignment,
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        'assets/images/lightBackground.png',
      ),
      fit: BoxFit.cover,
    ),
  ),
  child: child,
);

drawerItem(String text,IconData icon,VoidCallback onTap)=>[
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
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  const SizedBox(
    height: 15,
  )
];


