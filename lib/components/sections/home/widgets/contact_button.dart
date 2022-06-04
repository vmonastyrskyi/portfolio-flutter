import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/custom_button.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      text: 'Contact',
      width: 146.0,
      height: 48.0,
    );
  }
}
