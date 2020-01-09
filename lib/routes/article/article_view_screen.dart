import 'package:News/routes/home/widgets/article_image_widget.dart';
import 'package:News/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:News/data/api.dart' as Api;
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'logic/article_store.dart';

class ArticleViewScreen extends StatefulWidget {
  ArticleViewScreen(this.store);

  final ArticleStore store;

  @override
  _ArticleViewScreenState createState() => _ArticleViewScreenState();
}

class _ArticleViewScreenState extends State<ArticleViewScreen> {

  ReactionDisposer _disposer;

  @override
  void initState() {
    _disposer = autorun((_) {
      final String message = widget.store.message;
      if (null != message)
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
    });
    super.initState();
  }
  
  @override
  void dispose() {
    if(null != _disposer)
      _disposer();
    super.dispose();
  }

  Widget _articleDetails(BuildContext context) {
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
                widget.store.article.title,
                style: Theme.of(context).textTheme.headline.copyWith(fontSize: 24), //Todo: Use proper style
              ),
            ),
            Builder(
              builder: (BuildContext context) {
                final String faviconUrl = Api.getPublisherIconUrl(widget.store.article.source?.name);
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
                                'Article\nPublished on\n${widget.store.article.source?.name}',
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
                          'By ${widget.store.article.author ?? 'Unknown'}',
                          style: Theme.of(context).textTheme.display2.copyWith(
                            color: Theme.of(context).accentColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.store.article == null
                              ? 'Publication time N/A'
                              : relativeTimeString(DateTime.parse(widget.store.article.publishedAt)),
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
                widget.store.article.description ?? 'No article content available.',
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
                        onPressed: Provider.of<ArticleStore>(context).openLink,
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
                      Expanded(child: ArticleImageWidget(widget.store.article.urlToImage)),
                      Expanded(child: _articleDetails(context))
                    ],
                  ),
                );
                break;
              default:
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ArticleImageWidget(widget.store.article.urlToImage),
                    Expanded(child: _articleDetails(context)),
                  ],
                );
                break;
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 3,
          onPressed: widget.store.share,
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
