import 'package:flutter/material.dart';

class ZakatType {
  final List<double> nisab;
  final int id;
  final IconData icon;
  List? types;

  ZakatType({
    required this.id,
    required this.icon,
    required this.nisab,
    this.types,
  });
}
