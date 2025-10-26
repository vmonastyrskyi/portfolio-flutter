import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/section_title.dart';

import 'widgets/projects_grid_view.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SectionTitleText(title: 'My Projects'),
              SizedBox(height: 64.0),
              ProjectGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
