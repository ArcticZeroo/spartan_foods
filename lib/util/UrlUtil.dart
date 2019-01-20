import 'package:url_launcher/url_launcher.dart';

abstract class UrlUtil {
  static Future openGoogleSearch(String query) async {
    String url = 'https://google.com/search?q=${Uri.encodeFull(query)}';

    await launch(url);
  }
}