import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';
import 'package:portfolio/app_icons.dart';
import 'package:portfolio/components/shared_widgets/separated_column.dart';

class SkillsList extends StatelessWidget {
  const SkillsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SeparatedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      separator: SizedBox(height: 32.0),
      children: [
        _SkillListItem(
          iconData: AppIcons.github,
          skillName: 'Flutter',
          skillProgress: 0.95,
        ),
        _SkillListItem(
          iconData: AppIcons.github,
          skillName: 'Dart',
          skillProgress: 0.7,
        ),
        _SkillListItem(
          iconData: AppIcons.github,
          skillName: 'BLoC',
          skillProgress: 0.85,
        ),
      ],
    );
  }
}

class _SkillListItem extends StatelessWidget {
  const _SkillListItem({
    required this.iconData,
    required this.skillName,
    required this.skillProgress,
  });

  final IconData iconData;
  final String skillName;
  final double skillProgress;

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
          iconData,
          color: AppColors.primary,
        ),
        const SizedBox(width: 16.0),
        Text(
          skillName,
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
      '${(skillProgress * 100).toInt()}%',
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
      widthFactor: 1.0 * skillProgress,
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
