import 'package:get/get.dart';
import 'package:nzakiapplication/languages/utils/ar.dart';
import 'package:nzakiapplication/languages/utils/en.dart';

class Translation extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en':en,
    'ar':ar,
  };

}