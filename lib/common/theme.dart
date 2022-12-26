import 'package:flutter/material.dart';

import 'app.dart';

class AntTheme {
  static AntTheme defaultTheme() {
    return AntTheme(
      primaryColor: Color(0xff1677ff),
    );
  }

  static AntTheme? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AntApp>()?.theme;
  }

  final Color primaryColor;
  final Color borderColor;
  final AntTextTheme textTheme;

  const AntTheme({
    required this.primaryColor,
    this.borderColor = const Color(0xffeeeeee),
    this.textTheme = const AntTextTheme(),
  });
}

class AntTextTheme {
  final Color mainTextColor;
  final Color secondaryTextColor;
  final Color weakTextColor;
  final AntFontSize fontSize;

  const AntTextTheme({
    this.mainTextColor = const Color(0xff333333),
    this.secondaryTextColor = const Color(0xff666666),
    this.weakTextColor = const Color(0xff999999),
    this.fontSize = const AntFontSize(),
  });
}

class AntFontSize {
  final double main;
  final double size1;
  final double size2;
  final double size3;
  final double size4;
  final double size5;
  final double size6;
  final double size7;
  final double size8;
  final double size9;
  final double size10;

  const AntFontSize({
    this.main = 13.0,
    this.size1 = 9.0,
    this.size2 = 10.0,
    this.size3 = 11.0,
    this.size4 = 12.0,
    this.size5 = 13.0,
    this.size6 = 14.0,
    this.size7 = 15.0,
    this.size8 = 16.0,
    this.size9 = 17.0,
    this.size10 = 18.0,
  });
}
