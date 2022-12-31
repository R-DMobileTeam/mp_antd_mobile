import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mp_antd_mobile/navigator/common_tab_view.dart';

class AntRegularTabs extends StatelessWidget {
  final AntTabController? controller;
  final List<AntRegularTabItem> tabs;
  final bool tabBarScrollable;

  const AntRegularTabs({
    Key? key,
    required this.tabs,
    this.controller,
    this.tabBarScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntTabView(
      tabLocation: AntTabLocation.top,
      tabBarHeight: 42,
      tabBarDecoration: AntDivider(padding: EdgeInsets.zero),
      tabBarScrollable: tabBarScrollable,
      tabs: this.tabs.map((e) {
        return AntTabItem(
          activeTabWidget: (() {
            return AntRegularTabButton(item: e, actived: true);
          })(),
          inactiveTabWidget: (() {
            return AntRegularTabButton(item: e, actived: false);
          })(),
          builder: e.contentBuilder ??
              (context) {
                return Container();
              },
        );
      }).toList(),
      controller: controller,
      disabledPages: this.tabs.asMap().map((key, value) {
        return MapEntry(key, value.disabled);
      }),
    );
  }
}

class AntRegularTabItem extends StatelessWidget {
  final String title;
  final bool disabled;
  final WidgetBuilder? contentBuilder;

  const AntRegularTabItem(
      {Key? key,
      required this.title,
      this.disabled = false,
      this.contentBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AntRegularTabButton extends StatelessWidget {
  final AntRegularTabItem item;
  final bool actived;

  const AntRegularTabButton({
    Key? key,
    required this.item,
    required this.actived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context) ?? AntTheme(primaryColor: Colors.blue);
    return Opacity(
      opacity: this.item.disabled ? 0.5 : 1.0,
      child: Container(
        height: 42,
        margin: EdgeInsets.only(left: 6, right: 6),
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Container(
          height: 42,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: this.actived ? theme.primaryColor : Colors.transparent,
              ),
            ),
          ),
          child: Center(
            child: Text(
              this.item.title,
              style: TextStyle(
                color: this.actived
                    ? theme.primaryColor
                    : theme.textTheme.mainTextColor,
                fontSize: theme.textTheme.fontSize.size9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
