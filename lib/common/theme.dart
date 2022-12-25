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

  const AntTheme({
    required this.primaryColor,
  });
}

class AntFontSize {
  static final main = size5;
  static final size1 = 9.0;
  static final size2 = 10.0;
  static final size3 = 11.0;
  static final size4 = 12.0;
  static final size5 = 13.0;
  static final size6 = 14.0;
  static final size7 = 15.0;
  static final size8 = 16.0;
  static final size9 = 17.0;
  static final size10 = 18.0;
}
