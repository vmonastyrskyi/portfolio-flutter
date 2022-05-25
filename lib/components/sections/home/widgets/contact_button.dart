import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/custom_button.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      text: 'Contact',
      width: 146.0,
      height: 48.0,
    );
  }
}
