import 'package:flutter/widgets.dart';
import 'theme.dart';

class AntApp extends StatelessWidget {
  final Widget child;
  final AntTheme theme;

  const AntApp({
    Key? key,
    required this.child,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
