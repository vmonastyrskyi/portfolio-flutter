import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.size,
    this.backgroundColor,
    this.foregroundColor,
    this.iconSize = 21.0,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? context.appColors.primaryColor,
        ),
        foregroundColor: WidgetStatePropertyAll(
          foregroundColor ?? context.appColors.primaryTextColor,
        ),
        fixedSize: WidgetStatePropertyAll(Size(size, size)),
      ),
      icon: Icon(icon, size: iconSize),
    );
  }
}
