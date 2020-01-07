import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: 'Raleway',
  textTheme: TextTheme(
    headline: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
    title: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    subtitle: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.5),
    subhead: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    button: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
    body1: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    display4: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w700, fontSize: 20),
    labelColor: Colors.black,
    unselectedLabelColor: Colors.black54,
    unselectedLabelStyle: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w700, fontSize: 20),
    indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.red, width: 3)),
  ),
  brightness: Brightness.light,
  primarySwatch: Colors.red,
  accentColor: Colors.red,
  dividerColor: Colors.black38,
  scaffoldBackgroundColor: Colors.grey[100],
  backgroundColor: Colors.grey[100],
  cardColor: Colors.white,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white70,
    textTheme: ButtonTextTheme.normal,
  ),
);

final darkTheme = ThemeData(
  fontFamily: 'Raleway',
  textTheme: TextTheme(
    headline: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
    title: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    subtitle: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.5),
    subhead: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    button: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
    body1: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    display4: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w700, fontSize: 20),
    unselectedLabelStyle: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w700, fontSize: 20),
    indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.red, width: 3)),
  ),
  brightness: Brightness.dark,
  primarySwatch: Colors.red,
  accentColor: Colors.red,
  dividerColor: Colors.white30,
  scaffoldBackgroundColor: Colors.grey[850],
  backgroundColor: Colors.grey[850],
  cardColor: Colors.grey[800],
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white30,
    textTheme: ButtonTextTheme.normal,
  ),
);

final pitchBlack = ThemeData(
  fontFamily: 'Raleway',
  textTheme: TextTheme(
    headline: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
    title: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    subtitle: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.5),
    subhead: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    button: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
    body1: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    display4: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w700, fontSize: 20),
    unselectedLabelStyle: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w700, fontSize: 20),
    indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.red, width: 3)),
  ),
  brightness: Brightness.dark,
  primarySwatch: Colors.red,
  accentColor: Colors.red,
  dividerColor: Colors.white30,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  cardColor: Colors.grey[900],
  bottomAppBarColor: Colors.black,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white30,
    textTheme: ButtonTextTheme.normal,
  ),
);
