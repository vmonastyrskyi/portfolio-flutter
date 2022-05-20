import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (hovered) {},
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
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
