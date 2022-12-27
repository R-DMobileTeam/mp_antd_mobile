import 'package:flutter/widgets.dart';

class AntSafeArea extends StatelessWidget {
  final bool top;
  final bool bottom;
  final Color? color;
  final Widget? child;

  const AntSafeArea({
    Key? key,
    this.top = false,
    this.bottom = false,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (top) {
      return Container(
        height: MediaQuery.of(context).padding.top,
        color: color,
        child: Center(child: child),
      );
    } else if (bottom) {
      return Container(
        height: MediaQuery.of(context).padding.bottom,
        color: color,
        child: Center(child: child),
      );
    }
    return Container(height: 0);
  }
}
