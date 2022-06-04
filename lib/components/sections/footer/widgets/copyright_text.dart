import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.copyright,
      style: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }
}
