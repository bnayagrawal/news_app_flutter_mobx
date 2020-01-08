import 'package:News/data/api.dart';
import 'package:News/data/model/api_error.dart';
import 'package:News/data/model/article.dart';
import 'package:News/data/model/top_headlines.dart';
import 'package:News/routes/home/pages/topheadlines/logic/top_headlines_store.dart';
import 'package:News/routes/home/widgets/news_compact_view.dart';
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

class _TopHeadlinesPageState extends State<TopHeadlinesPage> with SingleTickerProviderStateMixin {
  // Reaction disposers
  List<ReactionDisposer> _disposers;
  TabController _tabController;
  final List<Tab> _tabs = <Tab>[
    Tab(key: ValueKey<NewsCategory>(NewsCategory.general), text: 'General'),
    Tab(key: ValueKey<NewsCategory>(NewsCategory.business), text: 'Business'),
    Tab(key: ValueKey<NewsCategory>(NewsCategory.entertainment), text: 'Entertainment'),
    Tab(key: ValueKey<NewsCategory>(NewsCategory.health), text: 'Health'),
    Tab(key: ValueKey<NewsCategory>(NewsCategory.science), text: 'Science'),
    Tab(key: ValueKey<NewsCategory>(NewsCategory.technology), text: 'Technology'),
    Tab(key: ValueKey<NewsCategory>(NewsCategory.sports), text: 'Sports'),
  ];

  @override
  void initState() {
    _setupObserver();
    _tabController = TabController(
      initialIndex: widget.store.activeTabIndex,
      vsync: this,
      length: _tabs.length,
    );
    _tabController.addListener(() {
      widget.store.setActiveTab(_tabController.index);
      widget.store.fetchTopHeadlines((_tabs[_tabController.index].key as ValueKey<NewsCategory>).value);
    });
    super.initState();
  }

  @override
  void dispose() {
    // Dispose reactions
    for (final d in _disposers) {
      d();
    }
    _tabController.dispose();
    super.dispose();
  }

  _showMessage(String message) {
    if (null != message)
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
  }

  _showErrorDialog(APIError apiError) {
    if (null != apiError)
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
        _showErrorDialog(error);
      })
    ];
  }

  Widget _buildArticleList(TopHeadlines topHeadlines, MenuItem view) {
    final List<Widget> items = <Widget>[];
    topHeadlines.articles.forEach((Article article) {
      Widget articleWidget;
      switch (view) {
        case MenuItem.LIST_VIEW:
          articleWidget = NewsListView(article);
          break;
        case MenuItem.THUMBNAIL_VIEW:
          articleWidget = NewsThumbnailView(article);
          break;
        case MenuItem.COMPACT_VIEW:
          articleWidget = NewsCompactView(article);
          break;
      }
      items.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => widget.store.onArticleClick(article, context),
            child: articleWidget,
          ),
        ),
      );
    });
    return ListView(padding: EdgeInsets.symmetric(vertical: 8), children: items);
  }

  Widget _buildPage(NewsCategory category) {
    return Observer(builder: (_) {
      final TopHeadlines topHeadlines = widget.store.newsData[category];
      if (widget.store.loadingStatus[category] ?? true) {
        return Center(
          // Todo: Replace with Shimmer
          child: CircularProgressIndicator(),
        );
      }
      if (null != topHeadlines && topHeadlines.articles.isNotEmpty)
        return _buildArticleList(topHeadlines, widget.store.view);
      else
        return Center(child: Text('Error!'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8, left: 8, right: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Top Headlines', style: Theme.of(context).textTheme.headline),
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
                        //Todo: Create a separate widget for PopupMenuItem
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
                                FontAwesomeIcons.addressCard,
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
                        PopupMenuItem<MenuItem>(
                          value: MenuItem.COMPACT_VIEW,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.image,
                                color: widget.store.view == MenuItem.COMPACT_VIEW
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).iconTheme.color,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Compact View',
                                  style: TextStyle(
                                    color: widget.store.view == MenuItem.COMPACT_VIEW
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
          TabBar(
            controller: _tabController,
            tabs: _tabs,
            isScrollable: true,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _buildPage(NewsCategory.general),
                _buildPage(NewsCategory.business),
                _buildPage(NewsCategory.entertainment),
                _buildPage(NewsCategory.health),
                _buildPage(NewsCategory.science),
                _buildPage(NewsCategory.technology),
                _buildPage(NewsCategory.sports),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuItem {
  LIST_VIEW,
  THUMBNAIL_VIEW,
  COMPACT_VIEW,
}
