import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '/widgets/widgets.dart';

class About extends StatelessWidget {
  final String title;
  final String content;
  final bool isArabic;

  const About({
    Key? key,
    required this.title,
    required this.content,
    this.isArabic = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextDirection? _textDirection;
    if (isArabic) {
      _textDirection = TextDirection.rtl;
    }
    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppBar(label: title.tr),
        body: BackgroundContainer(
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(
                    content.tr,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: _textDirection,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
