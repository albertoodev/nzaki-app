import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '/widgets/widgets.dart';

class About extends StatelessWidget {
  final String title;
  final String content;
  bool isArabic;

  About({Key? key,
    required this.title,
    required this.content,
    this.isArabic = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(label: title.tr),
        body: backgroundContainer(
          child: Card(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: SingleChildScrollView(
                   child: Text(
                      content.tr,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: (isArabic) ? TextDirection.rtl : TextDirection
                          .ltr,
                    ),
              )

          ),
        ),
      ),
    ),);
  }
}
