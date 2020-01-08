import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleImageWidget extends StatelessWidget {
  ArticleImageWidget(this.imageURL);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return imageURL != null
        ? Image.network(
            imageURL,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                          : null,
                    ),
                    Icon(FontAwesomeIcons.image, size: 16),
                  ],
                ),
              );
            },
          )
        : Opacity(
            opacity: 0.45,
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Icon(FontAwesomeIcons.image, size: 32),
            ),
          );
  }
}
