import 'package:flutter/material.dart';

class EverythingPage extends StatefulWidget {
  @override
  _EverythingPageState createState() => _EverythingPageState();
}

class _EverythingPageState extends State<EverythingPage> {
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
                child: Text('Everything', style: Theme.of(context).textTheme.headline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
