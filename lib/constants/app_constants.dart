import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';

class AppConstants {
  static const String name = 'Noor Fatima';
  static const String initials = 'NF';
  static const String title = 'Flutter Developer';
  static const String tagline = 'Building beautiful\nmobile experiences';

  static const String bio =
      'I build modern and user-friendly mobile applications with a focus on '
      'clean code and great user experiences.';

  static const String about =
      "I'm a passionate Flutter developer with a strong interest in building "
      'modern, responsive and user-friendly mobile applications. I love turning '
      'ideas into real-world solutions through clean and efficient code.';

  static const String degree = 'BS Information Technology';
  static const String university = 'Government College University Faisalabad';
  static const String years = '2023 - 2027';

  // Contact details
  static const String email = 'noorfatima0319.dev@gmail.com';
  static const String phone = '+92 319 0681801';
  static const String github = 'github.com/noorfatima-0319';
  static const String linkedin = 'linkedin.com/in/noor-fatima-6034bb3b4';

  static const List<Skill> skills = [
    Skill(name: 'Flutter', icon: Icons.flutter_dash, color: Color(0xFF42A5F5)),
    Skill(name: 'Dart', icon: Icons.code, color: Color(0xFF29B6F6)),
    Skill(name: 'Firebase', icon: Icons.local_fire_department, color: Color(0xFFFFA000)),
    Skill(name: 'Git', icon: Icons.alt_route, color: Color(0xFFF4511E)),
    Skill(name: 'GitHub', icon: Icons.hub, color: Color(0xFF8B949E)),
    Skill(name: 'UI/UX', icon: Icons.design_services, color: Color(0xFF7C4DFF)),
  ];

  static const List<Skill> interests = [
    Skill(name: 'Coding', icon: Icons.code),
    Skill(name: 'Design', icon: Icons.brush),
    Skill(name: 'Travel', icon: Icons.flight),
    Skill(name: 'Reading', icon: Icons.menu_book),
  ];

  static const List<Project> projects = [
    Project(
      title: 'Personal Portfolio App',
      description: 'A multi-screen Flutter app with clean UI and smooth navigation.',
      icon: Icons.phone_iphone,
    ),
    Project(
      title: 'Cartly',
      description: 'An e-commerce app for browsing and buying products on mobile.',
      icon: Icons.shopping_cart,
    ),
    Project(
      title: 'SpendWise',
      description: 'An expense tracker app to record and manage daily spending.',
      icon: Icons.account_balance_wallet,
    ),
    Project(
      title: 'Quizora',
      description: 'A quiz app that lets users test their knowledge with questions.',
      icon: Icons.quiz,
    ),
    Project(
      title: 'SkyCast',
      description: 'A weather app that shows current weather information for a city.',
      icon: Icons.wb_sunny,
    ),
  ];
}
