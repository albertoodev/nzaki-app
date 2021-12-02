import 'package:flutter/material.dart';
import 'package:get/get.dart';

defaultAppBar({required String label})=>AppBar(
  title: Text(label,style: Get.textTheme.headline5!.apply(color: Colors.white),),
  centerTitle: true,
);