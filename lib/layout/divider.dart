import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/theme.dart';

enum AntDividerPosition {
  left,
  center,
  right,
}

enum AntDividerDirection {
  horizontal,
  vertical,
}

class AntDivider extends StatelessWidget {
  final AntDividerPosition contentPosition;
  final AntDividerDirection direction;
  final Widget? child;
  final EdgeInsets padding;
  final double? height;

  AntDivider({
    Key? key,
    this.contentPosition = AntDividerPosition.center,
    this.direction = AntDividerDirection.horizontal,
    this.child,
    EdgeInsets? padding,
    this.height,
  })  : this.padding = padding ??
            (direction == AntDividerDirection.horizontal
                ? EdgeInsets.only(top: 16, bottom: 16)
                : EdgeInsets.only(left: 16, right: 16)),
        super(key: key);

  Widget renderBasic(BuildContext context) {
    return Center(
      child: Container(
        height: 1.0,
        color: AntTheme.of(context)?.borderColor ?? Color(0xffeeeeee),
      ),
    );
  }

  Widget renderChild(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: (() {
            if (contentPosition == AntDividerPosition.right) {
              return 8;
            }
            return 1;
          })(),
          child: Container(
            height: 1.0,
            color: AntTheme.of(context)?.borderColor ?? Color(0xffeeeeee),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: child ?? const SizedBox(),
        ),
        Flexible(
          flex: (() {
            if (contentPosition == AntDividerPosition.left) {
              return 8;
            }
            return 1;
          })(),
          child: Container(
            height: 1.0,
            color: AntTheme.of(context)?.borderColor ?? Color(0xffeeeeee),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.direction == AntDividerDirection.vertical) {
      return Container(
        padding: padding,
        child: Center(
          child: Container(
            width: 1.0,
            height: height ?? DefaultTextStyle.of(context).style.fontSize,
            color: AntTheme.of(context)?.borderColor ?? Color(0xffeeeeee),
          ),
        ),
      );
    }
    return DefaultTextStyle.merge(
      style: TextStyle(color: AntTheme.of(context)?.textTheme.weakTextColor),
      child: Container(
        padding: padding,
        child: (() {
          if (child == null) {
            return renderBasic(context);
          } else {
            return renderChild(context);
          }
        })(),
      ),
    );
  }
}
