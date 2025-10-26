import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';

class SkillListItem extends StatelessWidget {
  const SkillListItem({super.key, required this.skill});

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      backgroundColor: context.appColors.chipColor,
      labelStyle: TextStyle(
        color: context.appColors.primaryTextColor,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontSize: 14.0,
      ),
      label: Text(skill.toUpperCase()),
    );
  }
}
