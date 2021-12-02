import 'package:flutter/material.dart';
import '../view/home_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const  BoxDecoration(
        color: Colors.white,
        image:  DecorationImage(
          image: AssetImage(
        'assets/images/lightBackground.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SplashScreenView(
        navigateRoute: const HomeScreen(),
        duration: 3000,
        imageSrc: 'assets/images/logo.png',
        imageSize: 120,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
