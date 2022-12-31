import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/theme.dart';
import 'package:mp_antd_mobile/layout/divider.dart';
import 'package:mpcore/mpkit/mpkit.dart';

enum AntListMode {
  normal,
  card,
}

class AntList extends StatelessWidget {
  final Widget? header;
  final List<Widget> items;
  final AntListMode mode;

  const AntList({
    Key? key,
    this.header,
    this.items = const [],
    this.mode = AntListMode.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context) ?? AntTheme(primaryColor: Colors.blue);
    final children = <Widget>[];
    if (header != null) {
      children.add(DefaultTextStyle.merge(
        style: TextStyle(
            fontSize: theme.textTheme.fontSize.size7,
            color: theme.textTheme.weakTextColor),
        child: Padding(
          padding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
          child: header!,
        ),
      ));
    }
    if (mode == AntListMode.normal) {
      items.asMap().forEach((key, value) {
        if (key == 0) {
          children.add(AntDivider(padding: EdgeInsets.zero));
        } else if (key > 0) {
          children.add(AntDivider(padding: EdgeInsets.only(left: 12)));
        }
        children.add(value);
        if (key == items.length - 1) {
          children.add(AntDivider(padding: EdgeInsets.zero));
        }
      });
    } else if (mode == AntListMode.card) {
      final cardChildren = <Widget>[];
      items.asMap().forEach((key, value) {
        if (key > 0) {
          cardChildren.add(AntDivider(padding: EdgeInsets.only(left: 12)));
        }
        cardChildren.add(value);
      });
      children.add(Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Colors.white,
            child: Column(
              children: cardChildren,
            ),
          ),
        ),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class AntListItem extends StatelessWidget {
  final Widget? arrow;
  final Widget? leading;
  final Widget? title;
  final Widget? description;
  final Widget? trailing;
  final bool disabled;
  final void Function()? onPressed;

  const AntListItem({
    Key? key,
    dynamic arrow,
    this.leading,
    this.trailing,
    this.title,
    this.description,
    this.disabled = false,
    this.onPressed,
  })  : this.arrow = arrow is Widget
            ? arrow
            : (arrow == true
                ? const MPIcon(
                    MaterialIcons.keyboard_arrow_right,
                    color: Color(0xffcccccc),
                  )
                : null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context) ?? AntTheme(primaryColor: Colors.blue);
    Widget child = Container(
      color: Colors.white,
      constraints: BoxConstraints(minHeight: 44),
      padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
      child: Row(
        children: [
          leading ?? SizedBox(),
          leading != null ? SizedBox(width: 8) : SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle.merge(
                style: TextStyle(
                  color: theme.textTheme.mainTextColor,
                  fontSize: theme.textTheme.fontSize.size9,
                ),
                child: title ?? SizedBox(),
              ),
              DefaultTextStyle.merge(
                style: TextStyle(
                    color: theme.textTheme.weakTextColor,
                    fontSize: theme.textTheme.fontSize.main),
                child: description ?? SizedBox(),
              ),
            ],
          ),
          Flexible(child: Container()),
          DefaultTextStyle.merge(
            style: TextStyle(
              color: theme.textTheme.weakTextColor,
              fontSize: theme.textTheme.fontSize.size7,
            ),
            child: trailing ?? SizedBox(),
          ),
          arrow ?? SizedBox(),
        ],
      ),
    );
    if (disabled) {
      child = Opacity(opacity: 0.5, child: child);
    } else if (onPressed != null) {
      child = GestureDetector(
        onTap: () {
          onPressed?.call();
        },
        child: child,
      );
    }
    return child;
  }
}
