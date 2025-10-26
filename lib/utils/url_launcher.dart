import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> toUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
