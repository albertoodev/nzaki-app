import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({Key? key, required String label})
      : super(
          key: key,
          title: Text(
            label,
            style: Get.textTheme.headlineSmall!.apply(color: Colors.white),
          ),
          centerTitle: true,
        );
}

class BackgroundContainer extends Container {
  BackgroundContainer(
      {Key? key,
      required Widget child,
      EdgeInsetsGeometry padding = const EdgeInsets.all(15),
      Alignment alignment = Alignment.center})
      : super(
          key: key,
          padding: padding,
          height: double.infinity,
          width: double.infinity,
          alignment: alignment,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/lightBackground.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        );
}

class DrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const DrawerItem(
      {Key? key, required this.text, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ConditionBuilder extends StatelessWidget {
  final bool condition;
  final Widget builder;
  final Widget fullback;

  const ConditionBuilder({
    Key? key,
    required this.condition,
    required this.builder,
    required this.fullback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return builder;
    }
    return fullback;
  }
}
