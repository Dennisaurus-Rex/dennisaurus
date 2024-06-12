import 'package:url_launcher/url_launcher.dart' as launcher;

final class URLLauncher {
  const URLLauncher._();

  static Future<void> launchURL(URLLauncherIntent intent) async {
    final url = _SafeHttps.safeHttps(intent.link);
    if (await launcher.canLaunchUrl(url)) {
      await launcher.launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

enum URLLauncherIntent {
  linkedIn._("https://www.linkedin.com/in/dennisaurus-rex/"),
  github._("https://github.com/Dennisaurus-Rex"),
  email._("mailto:dennis@dennisaurus.dev?subject=Inquiry from Dennisaurus.dev");

  const URLLauncherIntent._(this.link);

  final String link;
}

extension _SafeHttps on Uri {
  static Uri safeHttps(String link) {
    link.replaceAll("https://", "");
    final uri = Uri.parse(link);
    return uri;
  }
}
