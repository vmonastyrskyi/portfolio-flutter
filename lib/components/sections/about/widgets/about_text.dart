import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.aboutMe,
      style: TextStyle(
        color: context.appColors.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontFamily: 'Poppins',
        fontSize: 16.0,
      ),
    );
  }
}
