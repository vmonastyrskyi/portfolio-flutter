import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/components/shared_widgets/custom_button.dart';
import 'package:portfolio/utils/url_launcher.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () => UrlLauncher.mailTo(AppStrings.email),
      text: 'Contact',
      width: 146.0,
      height: 48.0,
    );
  }
}
