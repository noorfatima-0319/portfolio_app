import 'package:flutter/material.dart';

class Skill {
  final String name;
  final IconData icon;
  final Color? color;

  const Skill({
    required this.name,
    required this.icon,
    this.color,
  });
}
