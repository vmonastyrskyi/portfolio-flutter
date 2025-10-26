import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';
import 'package:portfolio/components/theme/app_colors.dart';
import 'package:portfolio/utils/app_resources.dart';
import 'package:portfolio/utils/url_launcher.dart';

const List<_Project> _projects = [
  _Project(
    title: 'crpto',
    url: 'https://github.com/vmonastyrskyi/crpto',
    imagePath: AppResources.projectsCrpto,
    demoUrl: 'https://vmonastyrskyi.github.io/crpto-demo',
  ),
  _Project(
    title: 'Notes',
    url: 'https://github.com/vmonastyrskyi/notes-flutter',
    imagePath: AppResources.projectsNotes,
  ),
  _Project(
    title: 'Telegram',
    url: 'https://github.com/vmonastyrskyi/telegram-clone-flutter',
    imagePath: AppResources.projectsTelegram,
  ),
];

class ProjectGridView extends StatelessWidget {
  const ProjectGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 32.0,
        crossAxisSpacing: 32.0,
        childAspectRatio: 16 / 9,
        crossAxisCount: 3,
      ),
      itemBuilder: (_, index) {
        return DelayedFadeIn(
          delay: Duration(milliseconds: 250 * index),
          offset: const Offset(0.0, -0.25),
          child: _ProjectGridViewItem(project: _projects[index]),
        );
      },
      itemCount: _projects.length,
      clipBehavior: Clip.none,
      shrinkWrap: true,
    );
  }
}

class _ProjectGridViewItem extends StatefulWidget {
  const _ProjectGridViewItem({required this.project});

  final _Project project;

  @override
  State<_ProjectGridViewItem> createState() => _ProjectGridViewItemState();
}

class _ProjectGridViewItemState extends State<_ProjectGridViewItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => UrlLauncher.toUrl(widget.project.url),
      onHover: (hovered) {
        hovered
            ? _animationController.forward()
            : _animationController.reverse();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(0.0, 4.0),
              blurRadius: 16.0,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            _buildImage(),
            _buildTitle(),
            if (widget.project.demoUrl != null) _buildDemoPlayButton(),
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

  Widget _buildImage() {
    return Positioned.fill(
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 1.125).animate(
          CurvedAnimation(
            curve: Curves.easeInOutQuad,
            parent: _animationController,
          ),
        ),
        child: Image.asset(widget.project.imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTitle() {
    return Positioned.fill(
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(
              CurvedAnimation(
                curve: Curves.fastOutSlowIn,
                parent: _animationController,
              ),
            ),
        child: Container(
          alignment: Alignment.center,
          color: Colors.black.withValues(alpha: 0.6),
          child: Text(
            widget.project.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildDemoPlayButton() {
    return Positioned(
      right: 12.0,
      bottom: 12.0,
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            curve: Curves.fastOutSlowIn,
            parent: _animationController,
          ),
        ),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              curve: Curves.fastOutSlowIn,
              parent: _animationController,
            ),
          ),
          child: Tooltip(
            margin: const EdgeInsets.only(top: 6.0),
            message: 'Demo',
            child: IconButton.filled(
              onPressed: () => UrlLauncher.toUrl(widget.project.demoUrl!),
              padding: const EdgeInsets.all(12.0),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  context.appColors.primaryColor,
                ),
              ),
              icon: SvgPicture.asset(AppResources.demoPlay),
              iconSize: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _Project {
  const _Project({
    required this.title,
    required this.url,
    required this.imagePath,
    this.demoUrl,
  });

  final String title;
  final String url;
  final String imagePath;
  final String? demoUrl;
}
