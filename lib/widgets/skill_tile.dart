import 'package:flutter/material.dart';

import '../models/skill_model.dart';
import 'info_card.dart';

class SkillTile extends StatelessWidget {
  final Skill skill;

  const SkillTile({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: skill.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(skill.icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(skill.name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
