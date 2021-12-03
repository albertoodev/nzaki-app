import 'package:get/get.dart';
import '/controller/settings_controller.dart';

class GlobalBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}
