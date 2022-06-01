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
          'I\'am ${AppStrings.firstName}',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: AppColors.secondary,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptate cum expedita quo culpa tempora, assumenda, quis fugiat ut voluptates soluta, aut earum nemo recusandae cumque perferendis! Recusandae alias accusamus atque.',
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
