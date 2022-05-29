import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/section_title.dart';

import 'widgets/work_grid_view.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 88.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SectionTitleText(title: 'Work'),
              SizedBox(height: 64.0),
              WorksGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
