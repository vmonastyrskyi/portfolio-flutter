import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';

class SkillsText extends StatelessWidget {
  const SkillsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Professional Skills',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: AppColors.secondary,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Velit optio id vero amet, alias architecto consectetur error eum eaque sit.',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
