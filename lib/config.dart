import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/zakat_type.dart';

class Config {
  //themes list
  List themes = [
    {
      'index': 0,
      'value': ThemeMode.light,
      'label': 'lightMode'.tr,
    },
    {
      'index': 1,
      'value': ThemeMode.dark,
      'label': 'darkMode'.tr,
    },
    {
      'index': 2,
      'value': ThemeMode.system,
      'label': 'systemMode'.tr,
    }
  ];

  List<ZakatType> zakatTypes = [
    //zakat on money
    ZakatType(
      id: 0,
      name: 'name0'.tr,
      icon: Icons.home,
      unity: 'unity0'.tr,
      about: 'about0'.tr,
      nisab: 0,
    ),
    //zakat on cattle
    ZakatType(
      id: 1,
      name: 'name1'.tr,
      icon: Icons.home,
      about: 'about1'.tr,
      unity: 'unity',
      nisab: 0,
      list: [
        {'index': 0, 'value': 'chameaux'},
        {'index': 1, 'value': 'bovins'},
        {'index': 2, 'value': 'ovins'}
      ],
    ),
    //zakat on gold
    ZakatType(
      id: 2,
      name: 'name2'.tr,
      icon: Icons.home,
      unity: 'unity2'.tr,
      about: 'about2'.tr,
      nisab: 0,
    ),
    //zakat on silver
    ZakatType(
      id: 3,
      name: 'name3'.tr,
      icon: Icons.home,
      unity: 'unity3'.tr,
      about: 'about3'.tr,
      nisab: 0,
    ),
    //zakat on farm produce
    ZakatType(
      id: 4,
      name: 'name4'.tr,
      icon: Icons.home,
      unity: 'unity4',
      about: 'about4'.tr,
      nisab: 0,
      list: [
        {'index': 0, 'value': 'type1'},
        {'index': 2, 'value': 'type2'},
      ],
    ),
  ];
}

h6(String text) => Text(
      text,
      style: Get.theme.textTheme.headline6,
    );

const List languages = [
  {
    'value': 'en',
    'label': 'English',
  },
  {
    'value': 'fr',
    'label': 'Français',
  },
  {
    'value': 'ar',
    'label': 'عربي',
  }
];
BoxDecoration backgroundDecoration = const BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      'assets/images/lightBackground.png',
    ),
    fit: BoxFit.cover,
  ),
);

List<Map> calculationFunctions = [
  {},
  {
    'result': ({required int radioValue,required double input,}) {
      return '00';
    },
    'validate': (String? value,int radioValue) {
      try {
        double input=double.parse(value!);
        if ( input <= 0) {
          return 'value can not be zero or negative ';
        }else{
          if(radioValue==2) {
            if (input < 400) {
              return 'value can note be less than ' + 400.toString();
            }
          }
          else{
            if (input < 120) {
              return 'value can note be less than ' + 120.toString();
            }
          }
        }
      }catch (e){
        return 'enter number positive';
      };
    },
    'getNisab':(int radioValue){
      if(radioValue==2){
        return '400.0';
      }
      return '120';
    }
  },
];
