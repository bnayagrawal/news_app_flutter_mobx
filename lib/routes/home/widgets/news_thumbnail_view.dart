import 'package:News/data/model/article.dart';
import 'package:News/routes/home/widgets/article_image_widget.dart';
import 'package:News/routes/home/widgets/article_info_widget.dart';
import 'package:flutter/material.dart';

class NewsThumbnailView extends StatelessWidget {
  NewsThumbnailView(this.article);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      elevation: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 160),
                  child: ArticleImageWidget(article.urlToImage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ArticleInfoWidget(article),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
