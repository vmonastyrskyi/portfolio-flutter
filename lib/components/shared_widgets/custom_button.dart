import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
  });

  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (hovered) {
        setState(() => _hovered = hovered);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            if (_hovered)
              const BoxShadow(
                color: Color.fromRGBO(14, 36, 49, 0.2),
                offset: Offset(0.0, 4.0),
                blurRadius: 24.0,
              ),
          ],
          color: context.appColors.primaryColor,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
