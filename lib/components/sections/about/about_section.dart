import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/section_title.dart';

import 'widgets/about_text.dart';
import 'widgets/avatar.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SectionTitleText(title: 'About'),
              const SizedBox(height: 64.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(child: Avatar()),
                  Expanded(child: AboutText()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
