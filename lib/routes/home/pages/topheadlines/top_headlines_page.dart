import 'package:flutter/material.dart';

class TopHeadlinesPage extends StatefulWidget {
  @override
  _TopHeadlinesPageState createState() => _TopHeadlinesPageState();
}

class _TopHeadlinesPageState extends State<TopHeadlinesPage> {
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
              child: Opacity(
                opacity: 0.85,
                child: Text('Top Headlines', style: Theme.of(context).textTheme.headline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
