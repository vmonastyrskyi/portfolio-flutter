import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';

import 'widgets/copyright_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0.0, 1.0),
            blurRadius: 4.0,
          ),
        ],
        color: context.appColors.surfaceColor,
      ),
      child: const CopyrightText(),
    );
  }
}
