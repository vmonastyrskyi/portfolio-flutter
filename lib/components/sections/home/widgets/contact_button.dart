import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(context.appColors.primaryColor),
        foregroundColor: WidgetStatePropertyAll(
          context.appColors.primaryTextColor,
        ),
        fixedSize: const WidgetStatePropertyAll(Size(160.0, 56.0)),
      ),
      child: const Text(
        'Get in Touch',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          fontSize: 16.0,
        ),
      ),
    );
  }
}
