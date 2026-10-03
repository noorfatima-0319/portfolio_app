import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/project_model.dart';
import 'info_card.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  void _copyLink(BuildContext context) {
    Clipboard.setData(ClipboardData(text: project.link));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Project link copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InfoCard(
      child: InkWell(
        onTap: () => _copyLink(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Text(project.description, style: theme.textTheme.bodySmall),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.link, size: 16, color: theme.colorScheme.primary),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            project.link.replaceFirst('https://', ''),
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: theme.colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(project.icon, size: 30, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
