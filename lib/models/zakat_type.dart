import 'package:flutter/material.dart';

class ZakatType {
  final List<double> nisab;
  final int id;
  final String name;
  final IconData icon;
  final String? unity;
  final String about;
  final Function function;

  List? types;

  ZakatType({
    required this.id,
    required this.name,
    required this.icon,
    required this.about,
    required this.nisab,
    required this.function,
    this.unity,
    this.types,
  });
}
