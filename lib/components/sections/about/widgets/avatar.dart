import 'package:flutter/material.dart';
import 'package:portfolio/app_resources.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          AppResources.about,
          width: 300.0,
        ),
      ),
    );
  }
}
