import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.width,
    required this.height,
    this.iconSize = 21.0,
    this.color = AppColors.secondary,
    this.hoverColor = AppColors.primary,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final double width;
  final double height;
  final double iconSize;
  final Color color;
  final Color hoverColor;

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (hovered) {
        setState(() => _hovered = hovered);
      },
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: _hovered ? widget.hoverColor : widget.color,
          ),
        ),
      ),
    );
  }
}
