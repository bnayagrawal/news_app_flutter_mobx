import 'package:News/data/model/article.dart';
import 'package:News/routes/home/widgets/article_image_widget.dart';
import 'package:News/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:News/data/api.dart' as Api;

class ArticleViewScreen extends StatefulWidget {
  ArticleViewScreen(this.article);

  final Article article;

  @override
  _ArticleViewScreenState createState() => _ArticleViewScreenState();
}

class _ArticleViewScreenState extends State<ArticleViewScreen> {
  Widget _articleDetails() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                widget.article.title,
                style: Theme.of(context).textTheme.headline.copyWith(fontSize: 24), //Todo: Use proper style
              ),
            ),
            Builder(
              builder: (BuildContext context) {
                final String faviconUrl = Api.getPublisherIconUrl(widget.article.source?.name);
                return Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              faviconUrl,
                              width: 48,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                'Article\nPublished on\n${widget.article.source?.name}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Theme.of(context).dividerColor),
                          ),
                        ),
                        margin: EdgeInsets.only(left: 8),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.solidHeart,
                              size: 36,
                              color: Theme.of(context).accentColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text('Favourite', textAlign: TextAlign.center),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.solidUserCircle),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'By ${widget.article.author ?? 'Unknown'}',
                          style: Theme.of(context).textTheme.display2.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.article == null
                              ? 'Publication time N/A'
                              : relativeTimeString(DateTime.parse(widget.article.publishedAt)),
                          style: Theme.of(context).textTheme.display3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.75,
              child: Text(
                widget.article.description ?? 'No article content available.',
                style: Theme.of(context).textTheme.body2,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              margin: EdgeInsets.symmetric(vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'To read the complete article, please open this article in your web browser app.',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: OutlineButton.icon(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.link),
                        label: Text('Open Link'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          switch (orientation) {
            case Orientation.landscape:
              return SafeArea(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(child: ArticleImageWidget(widget.article.urlToImage)),
                    Expanded(child: _articleDetails())
                  ],
                ),
              );
              break;
            default:
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ArticleImageWidget(widget.article.urlToImage),
                  Expanded(child: _articleDetails()),
                ],
              );
              break;
          }
        },
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
            Text(
              'Home screen',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
