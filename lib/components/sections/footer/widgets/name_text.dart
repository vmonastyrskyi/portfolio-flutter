import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';

class NameText extends StatelessWidget {
  const NameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '{Name}',
      style: TextStyle(
        fontSize: 32.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }
}
