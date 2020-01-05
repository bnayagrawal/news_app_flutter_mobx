import 'package:News/data/model/article.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  NewsItem(this.article);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.network(article.urlToImage,fit: BoxFit.cover,),
              ),
            ),
            Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(article.title),
                )),
          ],
        ),
      ),
    );
  }
}
