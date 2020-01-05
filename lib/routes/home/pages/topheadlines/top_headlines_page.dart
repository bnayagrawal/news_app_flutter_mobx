import 'package:News/data/model/api_error.dart';
import 'package:News/data/model/article.dart';
import 'package:News/data/model/top_headlines.dart';
import 'package:News/routes/home/pages/topheadlines/logic/top_headlines_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import '../../widgets/news_item.dart';

class TopHeadlinesPage extends StatefulWidget {
  TopHeadlinesPage(this.store);

  final TopHeadlinesStore store;

  @override
  _TopHeadlinesPageState createState() => _TopHeadlinesPageState();
}

class _TopHeadlinesPageState extends State<TopHeadlinesPage> {
  BuildContext _context;

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
    topHeadlines.articles.forEach((Article article){
      items.add(NewsItem(article));
    });
    return ListView(children: items);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Opacity(opacity: 0.65, child: Icon(FontAwesomeIcons.filter)),
                  ),
                  Opacity(opacity: 0.65, child: Icon(FontAwesomeIcons.search)),
                ],
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                final TopHeadlines topHeadlines = widget.store.topHeadlines;
                if(widget.store.isLoading) {
                  return Center(
                    // Todo: Replace with Shimmer
                    child: CircularProgressIndicator(),
                  );
                }
                if(null != topHeadlines && topHeadlines.articles.isNotEmpty)
                  return _buildListView(topHeadlines);
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
