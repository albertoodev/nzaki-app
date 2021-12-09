import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controller/settings_controller.dart';
import '/view/home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.find<SettingsController>();
    bool isBoarding = settingsController.isOnBoarding;
    if (isBoarding) {
      Timer(
          const Duration(seconds: 2),
          () => Get.off(
                () => const HomeScreen(),
                transition: Transition.fadeIn,
                duration: const Duration(seconds: 1),
              ));
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/lightBackground.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          alignment: (isBoarding) ? Alignment.center : Alignment.bottomCenter,
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/icon.png',
                    width: 160,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 70,
                    child: Text(
                      'onBoardingTitle'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Get.theme.colorScheme.secondary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  (!isBoarding)
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: Get.theme.colorScheme.secondary,
                              onPressed: () {
                                settingsController.onBoardingDone();
                                Get.off(
                                  () => const HomeScreen(),
                                  transition: Transition.fade,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: Container(
                                width: 120,
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'start'.tr,
                                  style: Get.textTheme.headline6!.copyWith(
                                    color: Get.theme.scaffoldBackgroundColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            MaterialButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: Get.theme.scaffoldBackgroundColor
                                  .withOpacity(0.8),
                              child: Text(
                                '!language'.tr,
                                style: Get.textTheme.headline6!.copyWith(
                                  color: Get.theme.colorScheme.secondary,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () => settingsController
                                  .changeLanguageFromOnBoarding(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
