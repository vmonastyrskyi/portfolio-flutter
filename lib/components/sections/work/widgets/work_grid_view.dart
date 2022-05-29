import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';
import 'package:portfolio/app_resources.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';

class WorksGridView extends StatelessWidget {
  const WorksGridView({super.key});

  static const List<_Work> _works = [
    _Work(title: '', url: '', imagePath: AppResources.work1),
    _Work(title: '', url: '', imagePath: AppResources.work2),
    _Work(title: '', url: '', imagePath: AppResources.work3),
    _Work(title: '', url: '', imagePath: AppResources.work4),
    _Work(title: '', url: '', imagePath: AppResources.work5),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 32.0,
        crossAxisSpacing: 32.0,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (_, index) {
        return DelayedFadeIn(
          delay: Duration(milliseconds: 250 * index),
          offset: const Offset(0.0, -0.25),
          child: _WorkGridViewItem(work: _works[index]),
        );
      },
      itemCount: _works.length,
      clipBehavior: Clip.none,
      shrinkWrap: true,
    );
  }
}

class _WorkGridViewItem extends StatefulWidget {
  const _WorkGridViewItem({
    required this.work,
  });

  final _Work work;

  @override
  State<_WorkGridViewItem> createState() => _WorkGridViewItemState();
}

class _WorkGridViewItemState extends State<_WorkGridViewItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;

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

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
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
      child: Container(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 24.0,
              offset: Offset(0.0, 4.0),
              color: Color.fromRGBO(14, 36, 49, 0.15),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  widget.work.imagePath,
                  fit: BoxFit.cover,
                  isAntiAlias: true,
                ),
              ),
            ),
            Positioned.fill(
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 24.0,
                  ),
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    '{work.title}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
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

class _Work {
  const _Work({
    required this.title,
    required this.url,
    required this.imagePath,
  });

  final String title;
  final String url;
  final String imagePath;
}
