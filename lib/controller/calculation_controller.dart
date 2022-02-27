import 'package:get/get.dart';
import '/utils/data/calculations_functions.dart';

class CalculationController extends GetxController {

  RxString result = '- -'.obs;
  RxInt radioValue = 0.obs;
  RxInt dropDownUnity = 1.obs;
/// change the [radioValue] value
  changeCurrentRadioValue(
    int value,
  ) {
    radioValue.value = value;
  }
  /// change [result] to the initial value '- -'
  changeToInitialResult() {
    result.value = '- -';
  }
  /// calculate the result
  calculateResult({required double input, required int itemId}) {
    result.value = zakatFunctions[itemId](
        input: input, radioValue: radioValue.value,dropVal:dropDownUnity.value);
  }
  /// change the [dropDownUnity]
  changeDropDownUnity({required int value}){
    dropDownUnity.value =value;
  }
}
