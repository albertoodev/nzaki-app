import 'package:flutter/material.dart';

class ZakatType {
  final double nisab;
  final int id;
  final String name;
  final IconData icon;
  final String? unity;
  final String about;
  List? list;

  ZakatType({
    required this.id,
    required this.name,
    required this.icon,
    this.unity,
    this.list,
    required this.about,
    required this.nisab,
  });
}
