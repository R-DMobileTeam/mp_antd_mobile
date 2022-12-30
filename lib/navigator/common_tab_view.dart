import 'package:flutter/widgets.dart';

class AntTabItem {
  final Widget activeTabWidget;
  final Widget inactiveTabWidget;
  final WidgetBuilder builder;

  AntTabItem({
    required this.activeTabWidget,
    required this.inactiveTabWidget,
    required this.builder,
  });
}

class AntTabController extends ChangeNotifier {
  AntTabViewState? _state;
  final Future<bool> Function(int)? _canJump;

  AntTabController({Future<bool> Function(int)? canJump}) : _canJump = canJump;

  int get currentPage {
    final state = _state;
    if (state == null) return 0;
    return state.currentPage;
  }

  Future<bool> canJump(int page) async {
    return await _canJump?.call(page) ?? true;
  }

  void jumpToPage(int page) async {
    final state = _state;
    if (state == null) return;
    // ignore: invalid_use_of_protected_member
    state.setState(() {
      state.currentPage = page;
      state.loading = true;
    });
    await Future.delayed(Duration(milliseconds: 100));
    // ignore: invalid_use_of_protected_member
    state.setState(() {
      state.loading = false;
    });
  }
}

enum AntTabLocation {
  top,
  bottom,
}

class AntTabView extends StatefulWidget {
  final AntTabLocation tabLocation;
  final List<AntTabItem> tabs;
  final WidgetBuilder? loadingBuilder;
  final double tabBarHeight;
  final Color tabBarColor;
  final Widget Function(BuildContext, int)? tabBarBuilder;
  final Widget? tabBarDecoration;
  final AntTabController? controller;
  final bool keepAlive;
  final bool tabBarScrollable;
  final Map<int, bool> disabledPages;

  AntTabView({
    required this.tabs,
    this.tabLocation = AntTabLocation.bottom,
    this.loadingBuilder,
    this.tabBarHeight = 48,
    this.tabBarColor = Colors.white,
    this.tabBarBuilder,
    this.tabBarDecoration,
    this.controller,
    this.keepAlive = false,
    this.tabBarScrollable = false,
    required this.disabledPages,
  }) {
    assert(tabs.isNotEmpty);
  }

  @override
  State<AntTabView> createState() => AntTabViewState();
}

class AntTabViewState extends State<AntTabView> {
  int currentPage = 0;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    widget.controller?._state = this;
  }

  @override
  void didUpdateWidget(covariant AntTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.controller?._state = null;
    widget.controller?._state = this;
  }

  PreferredSizeWidget renderTabBar(BuildContext context) {
    if (widget.tabBarBuilder != null) {
      return _TabBar(
        widget.tabBarHeight,
        widget.tabBarBuilder!(context, currentPage),
        widget.tabBarDecoration,
        widget.tabBarColor,
        widget.tabBarScrollable,
      );
    }
    return _TabBar(
      widget.tabBarHeight,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.tabs
            .asMap()
            .map((k, v) {
              final child =
                  k == currentPage ? v.activeTabWidget : v.inactiveTabWidget;
              final handler = GestureDetector(
                onTap: () async {
                  if (widget.disabledPages[k] == true) {
                    return;
                  }
                  if (widget.controller != null) {
                    if (await widget.controller!.canJump(k) != true) {
                      return;
                    }
                  }
                  setState(() {
                    currentPage = k;
                    loading = true;
                  });
                  await Future.delayed(Duration(milliseconds: 100));
                  setState(() {
                    loading = false;
                  });
                },
                child: child,
              );
              return MapEntry(k, handler);
            })
            .values
            .toList(),
      ),
      widget.tabBarDecoration,
      widget.tabBarColor,
      widget.tabBarScrollable,
    );
  }

  Widget renderContent(BuildContext context) {
    if (widget.keepAlive) {
      return Stack(
          children: widget.tabs
              .asMap()
              .map((key, value) {
                return MapEntry(
                    key,
                    _IsTabActive(
                      actived: key == currentPage,
                      child: Positioned.fill(
                        child: value.builder(context),
                      ),
                    ));
              })
              .values
              .toList());
    } else {
      return widget.tabs[currentPage].builder(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabLocation == AntTabLocation.bottom) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          renderContent(context),
          renderTabBar(context),
        ],
      );
    } else if (widget.tabLocation == AntTabLocation.top) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          renderTabBar(context),
          renderContent(context),
        ],
      );
    } else {
      return Container();
    }
  }
}

class _TabBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget child;
  final Widget? decoration;
  final Color tabBarColor;
  final bool tabBarScrollable;

  _TabBar(
    this.height,
    this.child,
    this.decoration,
    this.tabBarColor,
    this.tabBarScrollable,
  );

  @override
  Widget build(BuildContext context) {
    if (this.decoration != null) {
      return Column(
        children: [
          _renderContent(),
          this.decoration!,
        ],
      );
    }
    return _renderContent();
  }

  Container _renderContent() {
    return Container(
      height: height,
      child: tabBarScrollable
          ? ListView(
              scrollDirection: Axis.horizontal,
              children: [child],
            )
          : Center(child: child),
      color: tabBarColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _IsTabActive extends StatelessWidget {
  final Widget child;
  final bool actived;

  _IsTabActive({required this.actived, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
