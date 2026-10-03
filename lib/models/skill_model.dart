import 'package:flutter/material.dart';

class Skill {
  final String name;
  final IconData icon;
  /// Optional brand color. When null, widgets use the theme's primary color.
  final Color? color;

  const Skill({
    required this.name,
    required this.icon,
    this.color,
  });
}
