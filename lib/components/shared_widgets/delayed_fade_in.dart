import 'package:flutter/material.dart';

class DelayedFadeIn extends StatefulWidget {
  const DelayedFadeIn({
    super.key,
    required this.delay,
    this.offset = const Offset(0.0, -0.125),
    required this.child,
  });

  final Duration delay;
  final Offset offset;
  final Widget child;

  @override
  DelayedFadeInState createState() => DelayedFadeInState();
}

class DelayedFadeInState extends State<DelayedFadeIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1250),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _positionAnimation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    Future.delayed(widget.delay, _animationController.forward);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _positionAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
