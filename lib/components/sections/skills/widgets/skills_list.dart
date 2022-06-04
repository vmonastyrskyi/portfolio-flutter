import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';
import 'package:portfolio/components/shared_widgets/separated_column.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_icons.dart';

class SkillsList extends StatelessWidget {
  const SkillsList({super.key});

  static const List<_Skill> _skills = [
    _Skill(
      skillName: 'Flutter',
      skillProgress: 0.85,
      iconData: AppIcons.flutter,
    ),
    _Skill(
      skillName: 'Dart',
      skillProgress: 0.8,
      iconData: AppIcons.dart,
    ),
    _Skill(
      skillName: 'BLoC',
      skillProgress: 1.0,
      iconData: AppIcons.bloc,
    ),
    _Skill(
      skillName: 'Provider',
      skillProgress: 0.75,
      iconData: Icons.flutter_dash_rounded,
    ),
    _Skill(
      skillName: 'Firebase services',
      skillProgress: 0.65,
      iconData: AppIcons.firebase,
    ),
    _Skill(
      skillName: 'Animations',
      skillProgress: 0.85,
      iconData: Icons.animation,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DelayedFadeIn(
          delay: Duration(milliseconds: 0),
          offset: Offset(0.0, -1.0),
          child: SizedBox(
            height: 48.0,
            child: CustomPaint(
              size: Size(double.infinity, 48.0),
              painter: _SkillLevelPainter(),
            ),
          ),
        ),
        const SizedBox(height: 32.0),
        SeparatedColumn(
          separator: const SizedBox(height: 32.0),
          children: _skills.mapIndexed((index, skill) {
            return DelayedFadeIn(
              delay: Duration(milliseconds: 250 * (index + 1)),
              offset: const Offset(0.0, -1.0),
              child: _SkillListItem(skill: skill),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SkillLevelPainter extends CustomPainter {
  const _SkillLevelPainter();

  static const double _levelLineWidth = 2.0;
  static const double _levelLineHeight = 24.0;
  static const double _subLevelLineHeight = 12.0;
  static const List<String> _levels = [
    'Beginner',
    'Elementary',
    'Intermediate',
    'Advanced',
    'Expert',
  ];

  final TextStyle _textStyle = const TextStyle(
    fontSize: 13.0,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final subLevels = _levels.length * (_levels.length - 1) * 2;
    final gap = (size.width - _levelLineWidth) / _levels.length;
    final subGap = (size.width - _levelLineWidth) / subLevels;

    for (int i = 0; i < _levels.length + 1; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            gap * i.toDouble(),
            size.height - _levelLineHeight,
            _levelLineWidth,
            _levelLineHeight,
          ),
          const Radius.circular(8.0),
        ),
        Paint()..color = AppColors.secondary,
      );
    }

    for (int i = 1; i < subLevels; i++) {
      if (i % ((_levels.length - 1) * 2) == 0) {
        continue;
      }

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            subGap * i.toDouble(),
            size.height - _subLevelLineHeight,
            _levelLineWidth,
            _subLevelLineHeight,
          ),
          const Radius.circular(8.0),
        ),
        Paint()..color = AppColors.secondary,
      );
    }

    for (int i = 0; i < _levels.length; i++) {
      final textSpan = TextSpan(
        text: _levels[i],
        style: _textStyle,
      );

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        maxLines: 1,
      );

      final offset = Offset(
        _levelLineWidth + gap * i,
        _levelLineWidth * 2,
      );

      textPainter.layout(
        minWidth: gap - (_levelLineWidth * 2),
        maxWidth: gap - (_levelLineWidth * 2),
      );
      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _SkillListItem extends StatelessWidget {
  const _SkillListItem({required this.skill});

  final _Skill skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 24.0,
            offset: Offset(0.0, 4.0),
            color: Color.fromRGBO(14, 36, 49, 0.15),
          ),
        ],
        color: AppColors.white,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            left: 16.0,
            top: 8.0,
            right: 16.0,
            bottom: 8.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSkillName(),
                _buildSkillPercent(),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildSkillProgressBar(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillName() {
    return Row(
      children: [
        Icon(
          skill.iconData,
          color: AppColors.primary,
          size: 24.0,
        ),
        const SizedBox(width: 16.0),
        Text(
          skill.skillName,
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillPercent() {
    return Text(
      '${(skill.skillProgress * 100).toInt()}%',
      style: const TextStyle(
        fontSize: 16.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColors.secondary,
      ),
    );
  }

  Widget _buildSkillProgressBar() {
    return FractionallySizedBox(
      widthFactor: 1.0 * skill.skillProgress,
      child: Container(
        height: 4.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _Skill {
  const _Skill({
    required this.skillName,
    required this.skillProgress,
    required this.iconData,
  });

  final String skillName;
  final double skillProgress;
  final IconData iconData;
}
