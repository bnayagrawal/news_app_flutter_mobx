import 'package:News/data/model/article.dart';
import 'package:flutter/material.dart';

import 'article_image_widget.dart';
import 'article_info_widget.dart';

class NewsCompactView extends StatelessWidget {
  NewsCompactView(this.article);

  final Article article;

  @override
  Widget build(BuildContext context) {
    // Todo: Not what I had in mind!
    return Card(
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      elevation: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: IntrinsicHeight(
          child: Stack(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 160),
                child: ArticleImageWidget(article.urlToImage),
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colors.transparent, Theme.of(context).cardColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ArticleInfoWidget(article),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
