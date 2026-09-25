import 'package:flutter/material.dart';

import '../models/skill_model.dart';
import 'info_card.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(skill.icon, size: 30, color: skill.color),
          const SizedBox(height: 8),
          Text(skill.name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
