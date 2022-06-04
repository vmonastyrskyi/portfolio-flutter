import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> toUrl(String url) async {
    final urlLaunchUri = Uri(
      scheme: 'https',
      path: url,
    );

    if (await canLaunchUrl(urlLaunchUri)) {
      await launchUrl(urlLaunchUri);
    }
  }
}
