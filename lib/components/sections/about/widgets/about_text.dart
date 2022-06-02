import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'I\'am ${AppStrings.name}',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: AppColors.secondary,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          AppStrings.aboutMe,
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
