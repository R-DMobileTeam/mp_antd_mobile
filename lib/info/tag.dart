import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/theme.dart';

class AntTagColor {
  static final normal = Color(0xff666666);
  static final primary = Color(0x00000000);
  static final success = Color(0xff00b578);
  static final warning = Color(0xffff8f1f);
  static final danger = Color(0xffff3141);
}

enum AntTagFill {
  solid,
  outline,
}

class AntTag extends StatelessWidget {
  final Color color;
  final AntTagFill fill;
  final void Function()? onPressed;
  final bool round;
  final Widget child;

  const AntTag({
    Key? key,
    required this.color,
    this.fill = AntTagFill.solid,
    this.onPressed,
    this.round = false,
    required this.child,
  }) : super(key: key);

  Color colorOfTag(BuildContext context) {
    if (color.value == 0) {
      return AntTheme.of(context)?.primaryColor ?? Colors.blue;
    }
    return color;
  }

  Widget renderSolid(BuildContext context) {
    final color = colorOfTag(context);
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            round ? BorderRadius.circular(99) : BorderRadius.circular(2),
      ),
      padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: AntTheme.of(context)?.textTheme.fontSize.size3,
          color: Colors.white,
          height: 1,
        ),
        textAlign: TextAlign.center,
        child: child,
      ),
    );
  }

  Widget renderOutline(BuildContext context) {
    final color = colorOfTag(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: color),
        borderRadius:
            round ? BorderRadius.circular(99) : BorderRadius.circular(2),
      ),
      padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: AntTheme.of(context)?.textTheme.fontSize.size3,
          color: color,
          height: 1,
        ),
        textAlign: TextAlign.center,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.fill == AntTagFill.solid) {
      return renderSolid(context);
    } else {
      return renderOutline(context);
    }
  }
}
