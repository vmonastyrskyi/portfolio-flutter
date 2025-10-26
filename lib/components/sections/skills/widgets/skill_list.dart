import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/sections/skills/widgets/skill_list_item.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';

class SkillList extends StatelessWidget {
  const SkillList({super.key});

  static const List<String> _skills = [
    'Flutter',
    'Dart',
    'Clean Architecture',
    'Provider',
    'BLoC',
    'Riverpod',
    'Firebase Services',
    'WebSockets',
    'REST API',
    'Animations',
    'Dart FFI',
    'SOLID',
    'MVVM',
    'MVC',
    'Figma',
    'Git',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.0,
      runSpacing: 16.0,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        ..._skills.mapIndexed((index, skill) {
          return DelayedFadeIn(
            offset: const Offset(0.0, -1.0),
            delay: Duration(milliseconds: 125 * (index + 1)),
            child: SkillListItem(skill: skill),
          );
        }),
      ],
    );
  }
}
