import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/theme.dart';
import 'package:mp_antd_mobile/layout/divider.dart';

class AntCard extends StatelessWidget {
  final Widget? title;
  final Widget? extra;
  final Widget? body;
  final List<Widget>? actions;

  const AntCard({
    Key? key,
    this.title,
    this.extra,
    this.body,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          title != null
              ? Container(
                  height: 44,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: DefaultTextStyle.merge(
                          style: TextStyle(
                            fontSize:
                                AntTheme.of(context)?.textTheme.fontSize.size7,
                            fontWeight: FontWeight.w500,
                          ),
                          child: title!,
                        ),
                      ),
                      extra ?? SizedBox()
                    ],
                  ),
                )
              : SizedBox(),
          title != null ? AntDivider(padding: EdgeInsets.zero) : SizedBox(),
          body != null
              ? ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 44),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: body,
                  ),
                )
              : SizedBox(),
          body != null && actions != null
              ? AntDivider(padding: EdgeInsets.zero)
              : SizedBox(),
          actions != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: (() {
                      final result = <Widget>[];
                      var index = 0;
                      actions!.forEach((element) {
                        if (index > 0) {
                          result.add(SizedBox(width: 8));
                        }
                        result.add(element);
                        index++;
                      });
                      return result;
                    })(),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
