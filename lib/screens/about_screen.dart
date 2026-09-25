import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../widgets/info_card.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/section_title.dart';

class AboutScreen extends StatelessWidget {
  final VoidCallback onBack;

  const AboutScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
        title: const Text('About Me'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const ProfileAvatar(radius: 50),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppConstants.name,
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(AppConstants.title, style: theme.textTheme.bodyMedium),
                              const SizedBox(height: 8),
                              Container(width: 32, height: 3, color: colors.primary),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppConstants.about,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
                    ),
                  ],
                ),
              ),
            ),
            const SectionTitle('Skills'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: AppConstants.skills
                  .map((skill) => Chip(
                        label: Text(skill.name),
                        backgroundColor: colors.surface,
                        shape: StadiumBorder(
                          side: BorderSide(color: colors.outlineVariant),
                        ),
                      ))
                  .toList(),
            ),
            const SectionTitle('Education'),
            InfoCard(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: CircleAvatar(
                  backgroundColor: colors.primary,
                  child: const Icon(Icons.school, color: Colors.white),
                ),
                title: const Text(
                  AppConstants.degree,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text('${AppConstants.university}\n${AppConstants.years}'),
                isThreeLine: true,
              ),
            ),
            const SectionTitle('Interests'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: AppConstants.interests
                  .map((item) => Column(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: colors.surface,
                            child: Icon(item.icon, color: colors.primary),
                          ),
                          const SizedBox(height: 6),
                          Text(item.name, style: theme.textTheme.bodySmall),
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
