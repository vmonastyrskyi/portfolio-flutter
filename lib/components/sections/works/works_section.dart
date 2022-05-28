import 'package:flutter/material.dart';

import 'widgets/title_text.dart';
import 'widgets/works_grid_view.dart';

class WorksSection extends StatelessWidget {
  const WorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TitleText(),
              SizedBox(height: 64.0),
              WorksGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
