import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

// Yeah, boilerplate...
class ArticleService {
  shareArticle(String title, String url) {
    Share.share(url, subject: title);
  }

  openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
