import 'package:get/get_utils/src/extensions/internacionalization.dart';

final List<Function> zakatFunctions = [
  //zakat on cattle
  ({
    required int radioValue,
    required double input,
  }) {
  int intInput = input.floor();
    switch (radioValue) {
      case 0:
        if (input <= 120) {
          return '1 C';
        }
        if ( input <= 200) {
          return '2 C';
        }
        if (input <= 399) {
          return '3 C';
        }
        return '${input ~/100} C';
      case 1:
        if (input <= 39) {
          return '1 T';
        }
        if ( input <= 59) {
          return '1 Mo';
        }
        if (input <= 69) {
          return '2 T';
        }
        if (input <= 79) {
          return '1 Mo  1 T';
        }
        if (input <= 89) {
          return '2 Mo';
        }
        if (input <= 99) {
          return '3 T';
        }
        if (input <= 119) {
          return '1 Mo  2 T';
        }
        if (input <= 119) {
          return '3 Mo ${'or'.tr} 4 T';
        }
        int mo=0,t=0;
        mo=intInput ~/40;
        int num1 = intInput%40;
        if(num1 != 0){
          int num2=(30-num1)~/10;
          if(num2<mo){
            t=1+num2;
            mo-=num2;
          }
        }
        return '$mo Mo  $t T';
      case 2:
        if (input <= 24) {
          return '${(input ~/ 5)} C';
        }
        if ( input <= 35) {
          return '1 M';
        }
        if (input <= 45) {
          return '1 C';
        }
        if (input <= 60) {
          return '1 H';
        }
        if (input <= 75) {
          return '1 J';
        }
        if (input <= 90) {
          return '2 L';
        }
        if (input <= 120) {
          return '2 H';
        }
        int h=0,l=0;
        h= intInput ~/50;
        print('h== $h  lesssgoooo');
        int num1 = intInput%50;
        if(num1 != 0){
          int num2=(40-num1)~/10;
          print(num2);
          if(num2<h){
            l=1+num2;
            h-=num2;
          }
        }
        return '$h H  $l L';
    }
  },
  // zakat on Farm Produce
      ({
    required int radioValue,
    required double input,
  }) {
        if(radioValue==0){
          return '${input/10} ' +'unity1'.tr;
        }
        return '${input/20} ' +'unity1'.tr;
  },
  // zakat on gold
      ({
    required int radioValue,
    required double input,
  })=>'${input /40} ' + 'unity2'.tr ,

  // zakat on money
      ({
    required int radioValue,
    required double input,
  })=>'${input /40} ' + 'unity3'.tr,
];
