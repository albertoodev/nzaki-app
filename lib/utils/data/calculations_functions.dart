import 'package:get/get_utils/src/extensions/internacionalization.dart';
typedef ZakatFunction =String Function({required int radioValue, required double input, required int dropVal});
final List<ZakatFunction> zakatFunctions = [
  /// zakat on cattle
  ({required int radioValue, required double input, required int dropVal}) {
    int intInput = input.floor();
    switch (radioValue) {
      case 0:
        if (input <= 120) {
          return '1 ' + 'unity00'.tr;
        }
        if (input <= 200) {
          return '2 ' + 'unity00'.tr;
        }
        if (input <= 399) {
          return '3 ' + 'unity00'.tr;
        }
        return '${input ~/ 100} ' + 'unity00'.tr;
      case 1:
        if (input <= 39) {
          return '1 ' + 'result11'.tr;
        }
        if (input <= 59) {
          return '1 ' + 'unity01'.tr;
        }
        if (input <= 69) {
          return '2 ' + 'result11'.tr;
        }
        if (input <= 79) {
          return '1 ' + 'unity01'.tr + '  1 ' + 'result11'.tr;
        }
        if (input <= 89) {
          return '2 ' + 'unity01'.tr;
        }
        if (input <= 99) {
          return '3 ' + 'unity01'.tr;
        }
        if (input <= 119) {
          return '1 ${'unity01'.tr}  2 ${'result11'.tr}';
        }
        if (input <= 119) {
          return '3 ${'unity01'.tr} ${'or'.tr} 4 ${'result'.tr}';
        }
        int mo = 0, t = 0;
        mo = intInput ~/ 40;
        int num1 = intInput % 40;
        if (num1 != 0) {
          int num2 = (30 - num1) ~/ 10;
          if (num2 < mo) {
            t = 1 + num2;
            mo -= num2;
          }
        }
        if (mo == 0) {
          return '$t ${'result11'.tr}';
        }
        if (t == 0) {
          return '$mo ${'unity01'.tr}';
        }
        return '$mo ${'unity01'.tr}\n$t ${'result11'.tr}';
      case 2:
        if (input <= 24) {
          return '${(input ~/ 5)} ${'unity00'.tr}';
        }
        if (input <= 35) {
          return '1 ' + 'M'.tr;
        }
        if (input <= 45) {
          return '1 ' + 'L'.tr;
        }
        if (input <= 60) {
          return '1 ' + 'H'.tr;
        }
        if (input <= 75) {
          return '1 ' + 'J'.tr;
        }
        if (input <= 90) {
          return '2 ' + 'L'.tr;
        }
        if (input <= 120) {
          return '2 ' + 'H'.tr;
        }
        int h = 0, l = 0;
        h = intInput ~/ 50;
        int num1 = intInput % 50;
        if (num1 != 0) {
          int num2 = (40 - num1) ~/ 10;
          if (num2 < h) {
            l = 1 + num2;
            h -= num2;
          }
        }
        if (h == 0) {
          return '$l ' + 'L'.tr;
        }
        if (l == 0) {
          return '$h ' + 'H'.tr;
        }
        return '$h ' + 'H'.tr + '\n' + '$l ' + 'L'.tr;
    }
    return 'wrong'.tr;
  },


  /// zakat on Farm Produce
  ({required int radioValue, required double input, required int dropVal}) {
    if (radioValue == 0) {
      return '${input / 10} ' + 'unity1'.tr;
    }
    return '${input / 20} ' + 'unity1'.tr;
  },


  /// zakat on gold
  ({required int radioValue, required double input, required int dropVal}) =>
      '${input / 40} ' + 'unity2'.tr,


  /// zakat on money
  ({required int radioValue, required double input, required int dropVal}) =>
      '${input / 40} ' + 'unity3$dropVal'.tr,
];
