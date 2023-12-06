import 'package:flutter/material.dart';
import 'package:nanoplan/app/core/extensions.dart';

import '../../../data/models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final Function()? onTap;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // surfaceTintColor: HexColor.fromHex(project.color),
      elevation: 0.5,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular( 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.project.icon != null
                  ? CodePointIcon.fromCodePoint(widget.project.icon!)
                  : const SizedBox.shrink(),
              const Spacer(),
              Text(
                widget.project.title,
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
