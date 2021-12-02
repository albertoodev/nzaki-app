import 'package:get/get.dart';
import 'package:nzakiapplication/config.dart';


class CalculationController extends GetxController{
  RxString result ='- -'.obs;
  RxInt radioValue = 0.obs;

  changeCurrentRadioValue(int value,) {
    radioValue.value= value;
  }

  getResult({
    required double input,required int itemId
}){
    result.value= calculationFunctions[itemId]['result'](input:input,radioValue:radioValue.value);
  }
}