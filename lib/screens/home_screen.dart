import 'package:flutter/material.dart';
import '../widgets/project_card.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/skill_card.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ValueChanged<int> onGoToTab;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.onGoToTab,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    // On very narrow screens the avatar is stacked above the text
    final isNarrow = MediaQuery.sizeOf(context).width < 360;

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hello 👋', style: theme.textTheme.titleLarge),
        Text.rich(
          TextSpan(
            text: "I'm ",
            children: [
              TextSpan(
                text: AppConstants.name,
                style: TextStyle(color: theme.colorScheme.primary),
              ),
            ],
          ),
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(AppConstants.title, style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        Text(
          AppConstants.bio,
          style: theme.textTheme.bodySmall?.copyWith(height: 1.6),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Change theme',
            onPressed: onToggleTheme,
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isNarrow)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: ProfileAvatar(radius: 56)),
                  const SizedBox(height: 16),
                  intro,
                ],
              )
            else
              Row(
                children: [
                  Expanded(child: intro),
                  const SizedBox(width: 16),
                  const ProfileAvatar(radius: 64),
                ],
              ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'About Me',
                    icon: Icons.arrow_forward,
                    iconAtEnd: true,
                    onPressed: () => onGoToTab(1),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    title: 'Contact Me',
                    icon: Icons.mail_outline,
                    filled: false,
                    onPressed: () => onGoToTab(2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Skills',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () => onGoToTab(1),
                  child: const Text('View All'),
                ),
              ],
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                return GridView.count(
                  crossAxisCount: constraints.maxWidth > 500 ? 6 : 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.05,
                  children: AppConstants.skills
                      .map((skill) => SkillCard(skill: skill))
                      .toList(),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Featured Projects',
              style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ...AppConstants.projects.map(
                  (project) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProjectCard(project: project),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
