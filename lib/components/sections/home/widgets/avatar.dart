import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_resources.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.125,
    ).animate(
      CurvedAnimation(
        curve: Curves.easeInOutQuad,
        parent: _animationController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (hovered) {
        hovered
            ? _animationController.forward()
            : _animationController.reverse();
      },
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      child: ClipPath(
        clipper: _AvatarClipper(),
        child: Container(
          width: 450.0,
          height: 450.0,
          color: AppColors.primary,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppResources.home,
                fit: BoxFit.cover,
                isAntiAlias: true,
                height: 450,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _AvatarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.06107674, size.height * 0.2378120);
    path.cubicTo(
        size.width * 0.09736417,
        size.height * 0.1926060,
        size.width * 0.1380671,
        size.height * 0.1683329,
        size.width * 0.1748252,
        size.height * 0.1485438);
    path.cubicTo(
        size.width * 0.3331989,
        size.height * 0.06334790,
        size.width * 0.4764434,
        size.height * 0.03182265,
        size.width * 0.5048413,
        size.height * 0.02411292);
    path.cubicTo(
        size.width * 0.5682491,
        size.height * 0.006909016,
        size.width * 0.6343912,
        size.height * -0.006954771,
        size.width * 0.6991662,
        size.height * 0.003751916);
    path.cubicTo(
        size.width * 0.7738479,
        size.height * 0.01608291,
        size.width * 0.8409539,
        size.height * 0.06085425,
        size.width * 0.8912274,
        size.height * 0.1185514);
    path.cubicTo(
        size.width * 1.004998,
        size.height * 0.2490906,
        size.width * 1.032858,
        size.height * 0.4506875,
        size.width * 0.9589385,
        size.height * 0.6082679);
    path.cubicTo(
        size.width * 0.9343061,
        size.height * 0.6607719,
        size.width * 0.8999238,
        size.height * 0.7077623,
        size.width * 0.8650260,
        size.height * 0.7538148);
    path.cubicTo(
        size.width * 0.7886408,
        size.height * 0.8546361,
        size.width * 0.7005559,
        size.height * 0.9582256,
        size.width * 0.5796799,
        size.height * 0.9901398);
    path.cubicTo(
        size.width * 0.4860588,
        size.height * 1.014848,
        size.width * 0.3842344,
        size.height * 0.9912837,
        size.width * 0.3014614,
        size.height * 0.9402896);
    path.cubicTo(
        size.width * 0.2186659,
        size.height * 0.8892727,
        size.width * 0.1533306,
        size.height * 0.8128389,
        size.width * 0.1009055,
        size.height * 0.7299078);
    path.cubicTo(
        size.width * 0.03749776,
        size.height * 0.6294983,
        size.width * 0.01674287,
        size.height * 0.5581661,
        size.width * 0.01055675,
        size.height * 0.5284482);
    path.cubicTo(
        size.width * 0.001681011,
        size.height * 0.4855986,
        size.width * 0.0005603371,
        size.height * 0.4478278,
        size.width * 0.0003362023,
        size.height * 0.4370525);
    path.cubicTo(
        size.width * -0.0003810292,
        size.height * 0.4016838,
        size.width * -0.001031020,
        size.height * 0.3697010,
        size.width * 0.01057916,
        size.height * 0.3308549);
    path.cubicTo(
        size.width * 0.02465483,
        size.height * 0.2837730,
        size.width * 0.04888381,
        size.height * 0.2529569,
        size.width * 0.06107674,
        size.height * 0.2377891);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
