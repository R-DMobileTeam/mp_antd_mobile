import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget renderTitle(String title) {
    return Container(
      height: 44,
      child: Text(
        title,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      name: 'AutoCenter',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderItem(context, 'Button', '/button'),
          renderItem(context, 'AutoCenter', '/auto_center'),
          renderItem(context, 'Divider', '/divider'),
          renderItem(context, 'SafeArea', '/safe_area'),
          renderItem(context, 'CapsuleTabs', '/capsule_tabs'),
          renderItem(context, 'JumboTabs', '/jumbo_tabs'),
          renderItem(context, 'RegularTabs', '/regular_tabs'),
          renderItem(context, 'Avatar', '/avatar'),
          renderItem(context, 'Card', '/card'),
        ],
      ),
    );
  }

  Widget renderItem(BuildContext context, String title, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(title),
            ),
          ),
          Container(height: 1, color: AntTheme.of(context)?.borderColor),
        ],
      ),
    );
  }
}
