import 'package:News/data/model/api_error.dart';
import 'package:News/data/model/article.dart';
import 'package:News/data/model/top_headlines.dart';
import 'package:News/routes/home/pages/topheadlines/logic/top_headlines_store.dart';
import 'package:News/routes/home/widgets/news_thumbnail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import '../../widgets/news_list_view.dart';

class TopHeadlinesPage extends StatefulWidget {
  TopHeadlinesPage(this.store);

  final TopHeadlinesStore store;

  @override
  _TopHeadlinesPageState createState() => _TopHeadlinesPageState();
}

class _TopHeadlinesPageState extends State<TopHeadlinesPage> {
  // Reaction disposers
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _setupObserver();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose reactions
    for (final d in _disposers) {
      d();
    }
    super.dispose();
  }

  _showMessage(String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  showErrorDialog(APIError apiError) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(
            'API Error - ${apiError.code}',
            style: Theme.of(context).textTheme.subhead,
          ),
          content: SingleChildScrollView(
            child: Text(
              apiError.message,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _setupObserver() {
    _disposers = [
      // Listens for error message
      autorun((_) {
        final String message = widget.store.error;
        _showMessage(message);
      }),
      // Listens for API error
      autorun((_) {
        final APIError error = widget.store.apiError;
        showErrorDialog(error);
      })
    ];
  }

  Widget _buildListView(TopHeadlines topHeadlines) {
    final List<Widget> items = <Widget>[];
    topHeadlines.articles.forEach((Article article) {
      items.add(NewsListView(article));
    });
    return ListView(children: items);
  }

  Widget _buildThumbnailView(TopHeadlines topHeadlines) {
    final List<Widget> items = <Widget>[];
    topHeadlines.articles.forEach((Article article) {
      items.add(NewsThumbnailView(article));
    });
    return ListView(children: items);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Opacity(
                      opacity: 0.85,
                      child: Text('Top Headlines', style: Theme.of(context).textTheme.headline),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Opacity(opacity: 0.65, child: Icon(FontAwesomeIcons.filter)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Opacity(opacity: 0.65, child: Icon(FontAwesomeIcons.search)),
                  ),
                  Opacity(
                    opacity: 0.65,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: PopupMenuButton<MenuItem>(
                        icon: Icon(FontAwesomeIcons.ellipsisV),
                        onSelected: widget.store.setView,
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
                          PopupMenuItem<MenuItem>(
                            value: MenuItem.LIST_VIEW,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.list,
                                  color: widget.store.view == MenuItem.LIST_VIEW
                                      ? Theme.of(context).accentColor
                                      : Theme.of(context).iconTheme.color,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    'List View',
                                    style: TextStyle(
                                      color: widget.store.view == MenuItem.LIST_VIEW
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).textTheme.headline.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<MenuItem>(
                            value: MenuItem.THUMBNAIL_VIEW,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.image,
                                  color: widget.store.view == MenuItem.THUMBNAIL_VIEW
                                      ? Theme.of(context).accentColor
                                      : Theme.of(context).iconTheme.color,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    'Thumbnail View',
                                    style: TextStyle(
                                      color: widget.store.view == MenuItem.THUMBNAIL_VIEW
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).textTheme.headline.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                final TopHeadlines topHeadlines = widget.store.topHeadlines;
                if (widget.store.isLoading) {
                  return Center(
                    // Todo: Replace with Shimmer
                    child: CircularProgressIndicator(),
                  );
                }
                if (null != topHeadlines && topHeadlines.articles.isNotEmpty)
                  return widget.store.view == MenuItem.LIST_VIEW
                      ? _buildListView(topHeadlines)
                      : _buildThumbnailView(topHeadlines);
                else
                  return Center(child: Text('Error!'));
              }),
            ),
          ],
        ),
      ),
    );
  }
}

enum MenuItem {
  LIST_VIEW,
  THUMBNAIL_VIEW,
}
