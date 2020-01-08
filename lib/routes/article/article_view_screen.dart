import 'package:News/data/model/article.dart';
import 'package:News/routes/home/widgets/article_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleViewScreen extends StatefulWidget {
  ArticleViewScreen(this.article);

  final Article article;

  @override
  _ArticleViewScreenState createState() => _ArticleViewScreenState();
}

class _ArticleViewScreenState extends State<ArticleViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ArticleImageWidget(widget.article.urlToImage),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Text(
                    widget.article.title,
                    style: Theme.of(context).textTheme.headline.copyWith(fontSize: 24), //Todo: Use proper style
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Opacity(
                    opacity: 0.75,
                    child: Text(
                      widget.article.content ?? 'No article content available. To read the complete article, please open this article in your web browser app',
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: () {},
        child: Icon(FontAwesomeIcons.share),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            BackButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text('Home screen',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
          ],
        ),
      ),
    );
  }
}
