import 'package:flutter/material.dart';
import 'package:portfolio/components/sections/skills/widgets/skill_list.dart';
import 'package:portfolio/components/shared_widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
              SectionTitleText(title: 'Skills'),
              SizedBox(height: 64.0),
              SkillList(),
            ],
          ),
        ),
      ),
    );
  }
}
