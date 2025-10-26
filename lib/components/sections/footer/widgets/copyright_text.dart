import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.copyright,
      style: TextStyle(
        color: context.appColors.primaryTextColor,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontSize: 14.0,
      ),
    );
  }
}
