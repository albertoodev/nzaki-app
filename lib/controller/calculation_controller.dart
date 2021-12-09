import 'package:get/get.dart';
import '/utils/data/global_data.dart';

class CalculationController extends GetxController {
  RxString result = '- -'.obs;
  RxInt radioValue = 0.obs;
  RxInt dropDownUnity = 1.obs;

  changeCurrentRadioValue(
    int value,
  ) {
    radioValue.value = value;
  }
  changeToInitialResult() {
    result.value = '- -';
  }
  getResult({required double input, required int itemId}) {
    result.value = zakatTypes[itemId].function(
        input: input, radioValue: radioValue.value,dropVal:dropDownUnity.value);
  }
  changeDropDownUnity({required int value}){
    dropDownUnity.value =value;
  }
}
