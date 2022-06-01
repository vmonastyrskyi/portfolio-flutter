import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

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
          boxShadow: [
            if (_hovered)
              const BoxShadow(
                blurRadius: 24.0,
                offset: Offset(0.0, 4.0),
                color: Color.fromRGBO(14, 36, 49, 0.15),
              ),
          ],
          color: AppColors.primary,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 16.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
