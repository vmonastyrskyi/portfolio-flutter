import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@ Vladyslav Monastyrskyi. All rights reserved',
      style: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }
}
