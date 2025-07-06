import 'package:url_launcher/url_launcher.dart';

final class URLLauncher {
  const URLLauncher._();

  static Future<bool> launchURL(URLLauncherIntent intent) async {
    final url = _SafeHttps.safeHttps(intent.link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      return true;
    } else {
      return false;
    }
  }
}

enum URLLauncherIntent {
  linkedIn._('https://www.linkedin.com/in/dennisaurus-rex/'),
  github._('https://github.com/Dennisaurus-Rex'),
  email._('mailto:dennis@dennisaurus.dev?subject=Inquiry from dennisaurus.dev');

  const URLLauncherIntent._(this.link);

  final String link;
}

extension _SafeHttps on Uri {
  static Uri safeHttps(String link) {
    link.replaceAll('https://', '');
    final uri = Uri.parse(link);
    return uri;
  }
}
