import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';
import 'package:portfolio/components/shared_widgets/section_title.dart';

import 'widgets/skills_image.dart';
import 'widgets/skills_list.dart';
import 'widgets/skills_text.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
              const SectionTitleText(title: 'Skills'),
              const SizedBox(height: 64.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        DelayedFadeIn(
                          delay: Duration(milliseconds: 0),
                          offset: Offset(0.0, -0.5),
                          child: SkillsText(),
                        ),
                        SizedBox(height: 32.0),
                        SkillsList(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32.0),
                  const DelayedFadeIn(
                    delay: Duration(milliseconds: 250),
                    offset: Offset(0.0, -0.25),
                    child: SkillsImage(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
