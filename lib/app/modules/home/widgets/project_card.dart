import 'package:flutter/material.dart';
import 'package:nanoplan/app/core/extensions.dart';

import '../../../data/models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  final Function()? onTap;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular( 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              project.icon != null
                  ? CodePointIcon.fromCodePoint(project.icon!)
                  : const SizedBox.shrink(),
              const Spacer(),
              Text(
                project.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
