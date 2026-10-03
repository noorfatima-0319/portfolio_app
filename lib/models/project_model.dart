import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final IconData icon;
  final String link;

  const Project({
    required this.title,
    required this.description,
    required this.icon,
    required this.link,
  });
}