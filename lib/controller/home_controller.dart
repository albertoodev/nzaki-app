
import 'package:get/get.dart';

class HomeController extends GetxController{
  int currentIndex=0;
  changeCurrentIndex(int newIndex){
    currentIndex=newIndex;
    update();
  }
}