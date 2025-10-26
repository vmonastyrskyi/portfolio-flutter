import 'package:flutter/material.dart';

import 'app_colors.dart';

export 'app_colors.dart';

final darkTheme = ThemeData.dark().copyWith(
  extensions: <ThemeExtension>[
    const AppColors(
      primaryColor: Color(0xFF4991E5),
      secondaryColor: Color(0xFF707579),
      backgroundColor: Color(0xFF181818),
      surfaceColor: Color(0xFF212121),
      borderColor: Color(0xFF0F0F0F),
      primaryTextColor: Color(0xFFFFFFFF),
      secondaryTextColor: Color(0xFFAAAAAA),
      chipColor: Color(0xFF2B2B2B),
      errorColor: Color(0xFFF24C4C),
    ),
  ],
);
