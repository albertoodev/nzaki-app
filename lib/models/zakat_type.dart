import 'package:flutter/material.dart';

class ZakatType {
  final List<double> nisab;
  final int id;
  final IconData icon;
  final Function function;

  List? types;

  ZakatType({
    required this.id,
    required this.icon,
    required this.nisab,
    required this.function,
    this.types,
  });
}
