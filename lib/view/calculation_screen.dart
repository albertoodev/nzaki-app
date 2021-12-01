import 'package:flutter/material.dart';
import '../config.dart';

class CalculationScreen extends StatelessWidget{

  const CalculationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: Config.backgroundDecoration,
        child: Text('Calculation Screen'),
      ),
    );
  }
}
